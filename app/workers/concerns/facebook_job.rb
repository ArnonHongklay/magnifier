module FacebookJob
  extend ActiveSupport::Concern

  # required fields for each type
  PHOTO_REQUIRED_FIELDS           = 'id,name,created_time,album'
  ALBUM_REQUIRED_FIELDS           = 'id,name,description,count,created_time,updated_time'
  POST_REQUIRED_FIELDS            = 'id,status_type,type,from,message,description,caption,picture,properties,object_id,created_time'
  PROMOTED_POST_REQUIRED_FIELDS   = 'id,status_type,type,from,message,description,caption,picture,properties,object_id,created_time,likes'
  PRIVATE_MESSAGE_REQUIRED_FIELDS = 'participants,link,messages.fields(from,message,attachments,shares)'

  ALL_PHOTOS                      = 'photos.filter(stream).limit(100).fields(id,name,created_time)'
  ALL_COMMENTS                    = 'comments.filter(stream).limit(1000).fields(from,message,created_time,parent,can_comment,attachment)'
  PROMOTED_LIMIT_COMMENTS         = 'comments.filter(stream).limit(50).fields(from,message,created_time,parent,can_comment,attachment)'

  included do
    def self.rescue_from_namespace(namespace, e, fb_browser=nil)
      case e
      # Skip this time if Facebook resource is overcrowded
      when Koala::HTTPService::CannotLockError
        $statsd.increment "#{namespace}.failure.limit"

      # Connection error
      when Faraday::ConnectionFailed,
           Faraday::TimeoutError,
           Errno::ENETUNREACH,
           Errno::ETIMEDOUT,
           Errno::ECONNREFUSED,
           Net::OpenTimeout,
           Net::ReadTimeout,
           OpenSSL::SSL::SSLError
        $statsd.increment "#{namespace}.failure.connection"

      # Spurious Facebook error
      when MultiJson::LoadError
        $statsd.increment "#{namespace}.failure.facebook"

      when Koala::Facebook::APIError
        case e.message

        # Remove expired token
        when /Error validating access token/,
             /The user must be an administrator of the page in order to impersonate it/,
             /You can only access the "conversations" connection for the current user/,
             /User does not have sufficient administrative permission for this action on this page/,
             /Invalid OAuth access token/,
             /Cannot send notifications to a user who has not installed the app/
          fb_browser.invalidate_token! if fb_browser

        # Squat on lock until it expires so we don't bother Facebook for a while
        when /(Application|User) request limit reached/,
             /Calls to stream have exceeded the rate of 600 calls per 600 seconds/
          $fb_lock.lock
          $statsd.increment "#{namespace}.failure.limit"

        # Ignore Facebook's 500/502 "something went wrong", don't requeue
        when /\[HTTP [45]00\]/,
             /\[HTTP 408\]/,
             /\[HTTP 503\]/,
             /Sorry, something went wrong/,
             /An (unexpected|unknown) error (has )?occurred/,
             /Cannot get application info due to a system error/,
             /Facebook returned invalid batch response/,
             /Response body:\Z/,
             /Service temporarily unavailable/,
             /id is not a member of the \w+ object/,
             /Unsupported get request/,
             /Permissions disallow message to user/,
             /There was an error posting to this wall/
          $statsd.increment "#{namespace}.failure.facebook"
        else
          $statsd.increment "#{namespace}.failure.api"
          raise e
        end

      else
        $statsd.increment "#{namespace}.failure.ruby"
        raise e
      end

      raise e if Rails.env.development?
    end
  end
end

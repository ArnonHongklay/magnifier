# Base class
# Public: High-level background job that polls Facebook and pulls new data
# regarding the Facebook page whose name is passed in as an argument.

class FacebookPoller < Struct.new(:account)
  include FacebookJob

  def self.perform(username=nil)
    if username
      account = Account.find(username)
      new(account).perform

    else
      queuing.each do |account|
        queue_name = :"#{@actual_queue || self.name.sub(/Poller$/, '').underscore}_#{account.realm_id}"
        Resque.enqueue_to(queue_name, self, account.username)
      end
    end

  rescue SignalException
    # Exits gracefully

  rescue Exception => e
    rescue_from_namespace 'poller', e, account
  end

  def self.queuing
    Account.ready.with_poller(self.name.underscore)
  end

  def fb
    account.fb
  end

  def get_account
    account.consume Hashie::Mash[fb.get_object(account.fbid)]
  end

  def get_feed(pages = 1)
    page = fb.get_connections(account.fbid, 'feed', limit: 100, fields: "#{POST_REQUIRED_FIELDS},#{ALL_COMMENTS}")
    pages.times do
      break unless page
      account.posts.consume Hashie::Mash[page.raw_response].data.compact
      page = page.next_page
    end
  end

  def get_promoted_posts(pages = 1)
    # 'is_inline' needs to change to 'include_inline' in v2.4

    # limit post to 100, comment to 50
    # by experiment, 100 posts would reach the created_time of last post around 1 day-itch ago, which should be fine
    # noted: too large limit can lead to Koala error
    page = fb.get_connections(account.fbid, 'promotable_posts', is_inline: true, limit: 100, fields: "#{PROMOTED_POST_REQUIRED_FIELDS},#{PROMOTED_LIMIT_COMMENTS}")
    pages.times do
      break unless page
      account.posts.consume Hashie::Mash[page.raw_response].data.compact.select { |post| post.likes? }
      page = page.next_page
    end
  end

  def get_private_messages(pages = 1)
    page = fb.get_connections(account.fbid, 'conversations', limit: 100, fields: PRIVATE_MESSAGE_REQUIRED_FIELDS)
    pages.times do
      break unless page
      account.private_conversations.consume Hashie::Mash[page.raw_response].data.compact
      page = page.next_page
    end
  end

  def get_updated_photos
    get_albums(true)
    get_all_photos(true)
  end

  def get_albums(updated = false, limit = 50)
    # facebook api limit albums to 50 (Dec 16 2014)
    fields =  "#{ALBUM_REQUIRED_FIELDS}"
    fields += ",#{ALL_COMMENTS}" unless updated
    page = fb.get_connections(account.fbid, 'albums', limit: limit, fields: fields)
    while page
      account.albums.consume Hashie::Mash[page.raw_response].data.compact
      page = page.next_page
    end
  end

  def get_all_photos(updated = false, limit = 100)
    # facebook api limit albums to 100 (Dec 16 2014)
    fields        = "#{PHOTO_REQUIRED_FIELDS}"
    target_albums = account.albums.fb_albums
    target_albums = target_albums.outdated if updated

    target_albums.each do |album|
      begin
        page = fb.get_connections(album.fbid, 'photos', limit: limit, fields: fields)
        fb_photos = Set.new
        while page
          response = Hashie::Mash[page.raw_response]
          account.photos.consume(response.data.compact, album)
          fb_photos += response.data.map { |data| data.id }
          page = page.next_page
        end
        album.update_photos! fb_photos
      rescue Koala::Facebook::APIError => e
        # Destroy!, if error three times, due to deleted on Facebook -> invalid id for album id
        album.destroy if album.stash.increment(:errors_count) >= 3
        album.stash.expire(:errors_count, 1.week)
      end
    end
  end
end

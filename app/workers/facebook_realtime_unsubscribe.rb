class FacebookRealtimeUnsubscribe
  extend Resque::Plugins::Retry
  @queue = :low_1
  @retry_limit = 2
  @retry_delay = 5

  def self.perform(account_id)
    account = Account.find(account_id)
    Koala::Facebook::API.new(account.realm.app_token).delete_connections(account.fbid, "subscribed_apps")

  rescue Koala::Facebook::ClientError # Silently pass, user has delete the app
  end
end

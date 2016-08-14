class FacebookRealtimeSubscribe
  extend Resque::Plugins::Retry
  @queue = :low_1
  @retry_limit = 2
  @retry_delay = 5

  def self.perform(account_id)
    account = Account.find(account_id)
    updates = Koala::Facebook::RealtimeUpdates.new(
      app_id: account.realm.fb_app_id,
      secret: account.realm.fb_secret
    )

    updates.subscribe("page", "feed",
      account.domain + '/realtime',
      account.domain
    )

    # add app_id to subscribed_apps list on specific account
    account.fb.put_connections(account.fbid, 'subscribed_apps')
  end
end

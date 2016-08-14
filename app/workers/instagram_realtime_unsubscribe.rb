class InstagramRealtimeUnsubscribe
  extend Resque::Plugins::Retry
  @queue = :low
  @retry_limit = 2
  @retry_delay = 5

  CALLBACK_URL = "https://#{App.host}/realtime/instagram"

  def self.perform(account_id)
    account = Account.find(account_id)
    client  = Instagram.client(access_token: account.instagram_account.access_token)

    client.delete_subscription account.subscription_id
  end
end

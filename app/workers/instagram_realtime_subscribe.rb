class InstagramRealtimeSubscribe
  extend Resque::Plugins::Retry
  @queue = :low
  @retry_limit = 2
  @retry_delay = 5

  CALLBACK_URL = "https://#{App.host}/realtime/instagram"
  VERIFY_TOKEN = 'thisisinstagramtoken'

  def self.perform(account_id)
    account = Account.find(account_id)
    client  = Instagram.client(access_token: account.instagram_account.access_token)

    result  = client.create_subscription({object: 'user', callback_url: CALLBACK_URL, verify_token: VERIFY_TOKEN})
    account.update!(subscription_id: result.id) if result.callback_url == CALLBACK_URL
  end
end

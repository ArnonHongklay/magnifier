class InstagramProfilePicture < Poller
  @queue = :low

  def self.perform(account_id, picture_url)
    account = Account.find(account_id)
    account.instagram_account.update!(picture: open(picture_url))
  end
end

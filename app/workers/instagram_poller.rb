class InstagramPoller < Poller
  @queue = :elephant

  def self.perform(account_id)
    account = Account.find(account_id)
    client  = Instagram.client(access_token: account.instagram_account.access_token)
    album   = account.albums.where(name: 'Instagram Album', type: 'InstagramAlbum').first_or_initialize

    album.description    = account.instagram_account.description
    album.created_time ||= Time.zone.now
    album.updated_time   = Time.zone.now
    album.save!

    # instagram fetch 20 photo each time, 20*5 = 100 photos limit
    last_photo_time = Time.zone.now.to_i
    5.times do
      photos = client.user_recent_media({max_timestamp: last_photo_time})
      break if account.photos.find_by(fbid: photos.first.id)
      last_photo_time = photos.last.created_time.to_i
      album.photos.consume photos
    end
  end
end

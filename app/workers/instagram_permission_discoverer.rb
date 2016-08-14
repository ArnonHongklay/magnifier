class PermissionDiscoverer
  extend Resque::Plugins::Retry
  @queue = :high_1
  @retry_limit = 2
  @retry_delay = 2

  def self.perform(user_id, realm_id)
    user = User.find(user_id)
    response    = user.fb.get_object('me', fields: 'permissions,token_for_business')

    user.update!(token_for_business: response["token_for_business"])

    permissions = response['permissions']['data']
    permissions_granted = permissions.select { |data| data["status"] == "granted" }.map { |data| data["permission"] }

    permissions_error   =  2
    permissions_error   = -1 if (['email', 'public_profile']                - permissions_granted).empty?
    permissions_error   =  1 if (['read_page_mailboxes', 'publish_actions'] - permissions_granted).empty?
    permissions_error   =  0 if (['read_insights', 'manage_pages']          - permissions_granted).empty?

    if permissions_error == 0
      user_pages = user.fb.get_connections('me', 'accounts', fields: 'username,name,likes,access_token,perms,is_published,cover,about')
      while user_pages
        user.permissions.consume Hashie::Mash[user_pages.raw_response].data.compact, realm_id
        break if user_pages.size < 25 # fb magic number limit to each user fetch accounts
        user_pages = user_pages.next_page
      end
    end

    # FIXME: this needs to run much faster
    # user.permissions.each { |permission| get_insights(permission) }
    user.update_attributes(permissions_fresh: true, permissions_error: permissions_error)
  end

  # def self.get_insights(permission)
  #   data = permission.fb.get_connections(permission.fbid, "insights/page_fan_adds_by_paid_non_paid_unique/day")

  #   bucket = []
  #   3.times do
  #     break unless data
  #     bucket += data[0]['values'].map { |day| day['value']['total'] }
  #     data = data.previous_page
  #   end

  #   permission.activities   = bucket.join(",")
  #   permission.max_activity = bucket.max
  #   permission.save
  # end
end

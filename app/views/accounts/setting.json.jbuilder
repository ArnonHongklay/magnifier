json.account do
	json.setting do
	  json.name     current_account.name
	  json.email    current_account.email
	  json.admin    current_account.admin?
  end
end if current_account

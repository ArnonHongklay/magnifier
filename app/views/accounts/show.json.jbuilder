json.account do
  json.name   current_account.name
  json.email  current_account.email
  json.admin  current_account.admin?
end if current_account

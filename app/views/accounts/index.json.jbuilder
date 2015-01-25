json.user do
  json.name     current_user.name
  json.email    current_user.email
  json.admin    admin?
end if current_user

json.array!(@users) do |user|
  json.extract! user, :id, :profile_name
  json.url user_url(user, format: :json)
end

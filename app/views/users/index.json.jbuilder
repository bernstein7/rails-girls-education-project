json.array!(@users) do |user|
  json.extract! user, :id, :name, :birthday, :sex
  json.url user_url(user, format: :json)
end

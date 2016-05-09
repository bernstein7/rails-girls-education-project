json.array!(@gifts) do |gift|
  json.extract! gift, :id, :descripption, :user_id, :name, :price
  json.url gift_url(gift, format: :json)
end

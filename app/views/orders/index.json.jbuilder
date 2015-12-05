json.array!(@orders) do |order|
  json.extract! order, :id, :productos
  json.url order_url(order, format: :json)
end

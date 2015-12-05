json.array!(@products) do |product|
  json.extract! product, :id, :nombre, :descripcion, :codigo, :precio, :categoria, :subcategoria, :marca
  json.url product_url(product, format: :json)
end

json.array!(@neighborhoods) do |neighborhood|
  json.extract! neighborhood, :id, :barrio, :fecha_entrega, :dealer_id
  json.url neighborhood_url(neighborhood, format: :json)
end

json.extract! country, :id, :short_name, :long_name, :alpha2, :alpha3, :country_code, :created_at, :updated_at
json.url country_url(country, format: :json)

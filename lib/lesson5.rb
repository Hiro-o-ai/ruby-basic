#5.2
currencies = {"japan" => "yen", "us" => "dollar", "india" => "rupee"}
#currencies["italy"] = "euro"
#currencies["japan"] = "円"

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  p "#{key}:#{value}"
end
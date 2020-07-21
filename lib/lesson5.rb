#5.2
currencies = {"japan" => "yen", "us" => "dollar", "india" => "rupee"}
#currencies["italy"] = "euro"
#currencies["japan"] = "円"

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  #p "#{key}:#{value}"
end

a = {"x" => 1, "y" => 2, "z" => 3 }

b = {"x" => 1, "y" => 2, "z" => 3 }

#p a == b

c = {"z" => 3, "y" => 2, "x" => 1 }

#p a == c

d = {"x" => 10, "y" => 2, "z" => 3 }

#p a == d

#p a.size

# currencies.delete("japan")
# p currencies

p currencies.delete("italy")
p currencies.delete("italy"){ | key| "Not found: #{key}"}















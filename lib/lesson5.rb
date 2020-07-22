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
# p currencies.delete("italy")
# p currencies.delete("italy"){ | key| "Not found: #{key}"}
# p :apple.class
# p "apple".class
# p :apple == :apple
# p "apple" == "apple"
# p :apple.object_id
# p "apple".object_id
# p :apple.object_id
# p "apple".object_id
# p :apple.object_id
# p "apple".object_id
# string = "apple"
# string.upcase!
# p string
# symbol = :apple
# symbol.upcase!
# p symbol
currencies = {:japan => "yen", :us => "dollar", :india => "rupee"}
# p currencies[:japan]
# p :apple.methods
# p "apple".methods
# p currencies[:us]
# currencies[:italy] = "euro"
# p currencies
currencies = {japan: "yen", us: "dollar", india: "rupee"}
# p currencies[:us]
hash = { "abc" => 123, def: 456}
# p hash["abc"]
# p hash[:def]
person = { name: "alice", age: 20, frends: ["bob", "carol"], phone: { home: "1234" } }
p person[:name]
p person[:frends]
p person[:phone][:home]







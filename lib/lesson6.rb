text = "I love Ruby. Python is a great language. Java and JavaScript are different."
# p text.scan(/[A-Z][A-Za-z]+/)
text = "私の郵便番号は1234567です。　僕の住所は6770056 兵庫県西脇市板波町1234だよ。"
# p text.gsub(/(\d{3})(\d{4})/, '\1-\2')
regex = /\d{3}-\d{4}/
# p regex.class
# if "123-4567" =~ /\d{3}-\d{4}/
#   p "マッチしました"
# else
#   p "マッチしませんでした"
# end
# # p "hello" =~ /\d{3}-\d{4}/
# p "hello" !~ /\d{3}-\d{4}/
# p /\d{3}-\d{4}/ =~ "hello"

text = "私の誕生日は1977年7月17日です。"
m = /(\d+)年(\d+)月(\d+)日/.match(text)
p m[1]
p m[2]
p m[3]
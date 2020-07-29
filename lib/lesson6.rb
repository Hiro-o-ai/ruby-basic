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

# text = "私の誕生日は1977年7月17日です。"
# m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
# p m[1]
# p m[2]
# p m[3]
# p m[:year]
# p m[:month]
# p m[:day]
# p "123 456 789".scan(/\d+/)
# p "1977年7月17日 2016年12月31日".scan(/(\d+)年(\d+)月(\d+)日/)
# p "1977年7月17日 2016年12月31日".scan(/(?:\d+)年(?:\d+)月(?:\d+)日/)
# p "1977年7月17日 2016年12月31日".scan(/\d+年\d+月\d+日/)
# text = "私の郵便番号は123-4567です。"
# p text[/\d{3}-\d{4}/]
# text = "郵便番号は123-4567 123-6542"
# # p text[/\d{3}-\d{4}/]
# p text.slice!(/\d{3}-\d{4}/)
# p text
# text = "123,234-2465"
# p text.split(",")
# p text.split(/,|-/)
# p text.gsub(",", ":")
# p text.gsub(/,|-/, ":")
# text = "誕生日は1933年1月21日です"
# p text.gsub(/(\d+)年(\d+)月(\d+)日/, '\1-\2-\3')
Regexp.new('\d{3}-\d{4}')
text = '03-1234-5678'
case text
when /^\d{3}-\d{4}$/
    p "郵便番号です"
when /^\d{4}\/\d{1,2}\/\d{1,2}$/
  p '日付です'
when /^\d+-\d+-\d+$/
  p '電話番号です'
end

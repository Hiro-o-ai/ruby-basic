# 例外クラスの継承を意識した書き方
# begin
#   1/0
# rescue NoMethodError
#   puts "NoMethodErrorです"
# rescue NameError
#   puts "NameErrorです"
# rescue StandardError
#   puts "その他のエラーです"
# end

# begin
#   1/0
# rescue NoMethodError
#   puts "NoMethodErrorです"
# rescue NameError
#   puts "NameErrorです"
# rescue
#   puts "その他のエラーです"
# end

# 例外発生時に処理をやり直す
# retry_count = 0
# begin
#   puts '処理を開始します'
#   1/0
# rescue
#   retry_count = 1
#   if retry_count <= 3
#     puts "retryします。 (#{retry_count}回目)"
#     retry
#   else
#     puts 'retryに失敗しました'
#   end
# end

# 意図的に例外を発生させる raise
# def currency_of(country)
#   case country
#   when :japan
#     'yen'
#   when :us
#     'dollar'
#   when :india
#     'rupee'
#   else
#     raise あまり良くない
#     raise "無効な国名です。 #{country}"
#     通常はRuntimeErrorが発生、それ以外でやるのはデバックがしにくくなる
#     raise ArgumentError, "無効な国名です。#{country}"
#     # 例外クラスのインスタンスを渡す。引数はエラーメッセージ
#     raise ArgumentError.new("無効な国名です。#{country}")
#   end
# end

# 例外処理をすべき場合
# 複数のユーザーにメールを送信する際に一人目で例外が発生して、他に送信できない場合
# users.each do |user|
#   begin
#     send_mail_to(user)
#   rescue => e
#     記録を残す
#     ターミナル
#     puts "#{e.class}: #{e.message}"
#     ログファイル
#     puts e.backtrace
#   end
# end

# ターミナルへの文字入力の受付
# ver1
# input = gets
# hello
# p input =>hello\n

# ver2
# input = gets or input = gets.chomp
# hello
# input = input.chomp
# p input => hello

# 例外処理に入れた例外が起きなくても実行したい場合 ensure
# また、同様のことがelseでも可能
# 書く順番は
#   begin
#   rescue
#   else
#   ensure
# この節にreturnを使用してはならない
#   end




































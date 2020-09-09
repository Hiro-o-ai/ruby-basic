# ブロックの利用 yield
# def greeting
#   puts 'おはよう'
#   yield
# yieldが複数入るとブロックの中身が複数はいる
#   puts 'こんばんは'
# end
# 下の記述をするとgreetingメソッドが動く
# それに加えてyieldのところにコードが入る
# greeting do
#   puts 'こんにちは'
# end

# block_given?やblock.nil?メソッドでブロックが渡されているか確認できる

# def greeting
#   puts 'o'
#   textにはブロックの結果が入る
#   text = yield 'kn'
#   puts text
#   puts 'konw'
# end
# greeting do |s|
#   sにはyieldの後のが入る
#     引数が複数の場合は|s, i|と複数にすれば良いが、
#     なくてもエラーは起きない
#   s * 2
# end

# 上のコードの別の書き方
# &引数(一つのメソッドに一つの引数で順番は最後に持ってくる)
# def greeting(&block)
#   puts 'おはよう'
#   text = block.call('こんにちは')
#   puts text
#   puts 'こんばんは'
# end

# greeting do |s|
#   s * 2
# end

# def greeting_ja(&block)
#   texts = ['おはよう', 'こんにちは', 'こんばんわ']
#   greeting_common(texts, &block)
# end

# def greeting_en(&block)
#   texts = ['good  morning', 'hello', 'good evening']
#   greeting_common(texts, &block)
# end

# def greeting_common(texts, &block)
#   puts texts[0]
#   puts block.call(texts[1])
#   puts texts[2]
# end

# greeting_ja do |text|
#   text * 2
# end
# greeting_en do |text|
#   text.upcase
# end

# block.arityで引数の個数がわかる

# ブロックをオブジェクト化するクラス
# hello_proc = Proc.new do
#   'Hello!'
# end
# 上下のコードは同じ意味
# hello_proc = Proc.new { 'Hello' }
# 呼び出し
# p hello_proc.call

# add_proc = Proc.new{ |a = 0, b = 0| a + b }
# p add_proc.call  0
# p add_proc.call(10)  10
# p add_proc.call(10, 20)  30

# Procとブロックの併用
# def greeting(&block)
#   puts 'おはよう'
#   text = block.call('こんにちは')
#   puts text
#   puts 'こんばんは'
# end
# repeat_proc = Proc.new { |text| text * 2 }
# greeting(&repeat_proc)

# Procオブジェクトを実行する他の方法
# p add_proc = Proc.new { |a, b| a + b }
# p add_proc.call(10, 20)
# p add_proc.yield(10, 20)
# p add_proc.(10, 20)
# p add_proc[10, 20]
# p add_proc === [10, 20]

# def judge(age)
#   adult = Proc.new { |n| n > 20 }
#   child = Proc.new { |n| n < 20 }
#   case age
#   when adult
#     '大人です'
#   when child
#     '子供です'
#   else
#     '二十歳です'
#   end
# end
# p judge(25)
# p judge(18)
# p judge(20)

# reverse_proc = Proc.new { |s| s.reverse }
# p ['Ruby', 'Java', 'Perl'].map(&reverse_proc)
# other_proc = reverse_proc.to_proc
# p reverse_proc.equal?(other_proc)










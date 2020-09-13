# 基礎の基礎
# メソッドの定義
# def hello(names)
#   names.each do |name|
#     puts "hello, #{name.upcase}"
#   end
# end
# rubies = ['mri', 'jruby', 'rubinius']
# hello(rubies)

# returnについて
# def add(a, b)
#   return a + b
#   puts '表示されません'
# end
# p add(1, 1) 結果：2

# 行をなくすには;
# name = 'ruby' ; puts(name.upcase)

# ローカル変数とグローバル変数と定数
# foo = 'fun' 一定の範囲でのみ呼び出しできる
# $bar = 'fun' 様々なところから呼び出しできる
# FOO = 'fun' 再代入できるがしないようにすること

# class Ruler
#   attr_accessor :length
#   def display_length
#     puts length
#   end
# end
# ruler = Ruler.new
# attr_accessorでlengthがメソッドとして使える
# これはdef length=(val)
#         @length = val
#     end
# に等しい
# @がつくインスタンス変数にオブジェクトの状態を保持できる
# ruler.length = 30
# ruler.display_length

# Proc
# greeter = Proc.new { |name|
#   puts "hello #{name}!"
# }
# greeter.call 'Ruby' or ('Ruby')
# callに渡した引数がブロックの仮引数に代入







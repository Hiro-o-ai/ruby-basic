# モジュールについて
# deep_freezeについて
# class Team
#   COUNTRIES = ["japan".freeze, "us".freeze, "india".freeze].freeze
#   上下のコードは同義
#   COUNTRIES = deep_freeze(["japan","us","india"])
# end

# モジュールの作り方
# module Greeeter
#   def hello
#     "hello"
#   end
# end
# インスタンスが作成できない
# greeter = Greeter.new　エラー
# # 他のモジュールやクラスを継承できない
# module AwesomeGreeter < Greeter
# end
# シンタックスエラー

# mixin
# module Loggable
#   logメソッドをprabateメソッドにする
#   private
#   def log(text)
#     puts "[LOG] #{text}"
#   end
# end
# class Product
#   include Loggable
#   def title
#     log 'title is called.'
#     'A great movie'
#   end
# end
# class User
#   include Loggable
#   def name
#     log 'name is called'
#     'alice'
#   end
# end
# product = Product.new
# p product.title

# モジュールのextend

# module Loggable
#   def log(text)
#     puts "[LOG] #{text}"
#   end
# end

# class Product
#   extend Loggable

#   def self.create_products(names)
#     log 'create_products is called'
#   end
# end

# p Product.create_products([])
# p Product.log("hello")

# NG例  moduleでインスタンスを変更している
# module NameChanger
#   def change_name
#     @name = 'アリス'
#   end
# end
# class User
#   include NameChanger
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end
# # OK例　メソッド経由でデータを変更している
# module NameChanger
#   def change_name
#     self.name = 'アリス'
#   end
# end
# class User
#   include NameChanger
#   attr_reader :name
#   def initialize(name)
#     @name = name
#   end
# end

# namespaceとしてのmodule
# 同じクラス名でも問題なし
# module Baseball
#   class Second
#   end
# end
# module Clock
#   class Second
#   end
# end
# Baseball::Second.new
# Clock::Second.new
# namespaceにない、同名のメソッドをmoduleないで呼び出す場合
# ::Second.new

# moduleと特異メソッド
# module Loggable
#   def self.log(text)
#     puts "[LOG]#{text}"
#   end
# end
# Loggable.log('hello')

# module_function ミックスインや特異メソッドとして利用可
# module Loggable
#   def log(text)
#     puts "[LOG] #{text}"
#   end
#   module_function :log 他のクラスに入るとprivateメソッドとなる
# end
# 特異メソッド
# Loggable.log('hello')
# class Product
#   include Loggable
#   def title
#     log 'title is called'
#     'A great movie'
#   end
# end
# ミックスイン
# product = Product.new
# product.title

# 引数(:〇〇)を指定しないとしたのメソッドは全てなる
# module_function
#   def log
#   end


































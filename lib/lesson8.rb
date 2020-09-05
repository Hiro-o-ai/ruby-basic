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
























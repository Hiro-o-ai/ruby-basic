# users = []
# users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
# users << { first_name: 'Bob', last_name: 'Python', age: 30 }
# users.each do |user|
#   p "氏名: #{user[:first_name]} #{user[:last_name]}、 年齢: #{user[:age]}"
# end
# def full_name(user)
#   "#{user[:first_name]} #{user[:last_name]}"
# end
# users.each do |user|
#   p "氏名: #{full_name(user)}、 年齢: #{user[:age]}"
# end
# p users[0][:first_name]
# users[0][:contry] = "japan"
# users[0][:first_name] = "Carol"
# p users[0]
# class User
#   attr_reader :first_name, :last_name, :age

#   def initialize(first_name, last_name, age)
#     @first_name = first_name
#     @last_name = last_name
#     @age = age
#   end

#   def full_name
#     "#{first_name} #{last_name}"
#   end
# end
# users = []
# users << User.new('Alice','Ruby', 20)
# users << User.new('Bob', 'Python', 30)
# # users.each do |user|
# #   p "氏名: #{user.full_name}、 年齢: #{user.age}"
# # end
# # p users[0].first_name
# alice = User.new('Alice', 'Ruby', 20)
# bob = User.new('Bob', 'Python', 30)
# p alice.full_name
# p bob.full_name
# class User
#   def initialize
#     puts "initialized"
#   end
#   def hello
#     "hello"
#   end
# end
# # User.new
# user = User.new
# # user.initialize
# p user.hello
# class User
# # nameとname=(value)メソッドと同じ効果を持つ
#   attr_accessor :name, :age
# # 読み込み専用に変えたいときはattr_readerメソッドを使用
# # 書き込み専用にしたいときはattr_writerを使用する
#   def initialize(name)
#     @name = name
#     # @age = age
#   end

# # 外部から@nameを参照するためのメソッド
#   # def name
#   #   @name
#   # end

# # 外部から@nameを変更するためのメソッド
#   # def name=(value)
#   #   @name = value
#   # end

#   def self.create_users(names)
#     names.map do |name|
# #       User.new(name)
# #     end
# #   end

# #   def hello
# #     # shuffled_name = @name.chars.shuffle.join
# #     "hello, i am #{@name}"
# #   end
# # end
# user = User.new("alice")
# # p user.hello
# alice = User.new('Alice')
# # p alice.hello
# bob = User.new('Bob')
# # p bob.hello
# names = ['Alice', 'Bob', 'Carol']
# users = User.create_users(names)
# # users.each do |user|
# #   # p user.hello
# # # end
# # class Product
# # 定数は必ず大文字でなくてはならない
#   DEFAULT_PRICE = 0

#   attr_reader :name, :price

#   # def initialize(name, price = DEFAULT_PRICE )
#   #   @name = name
#   #   @price = price
#   # end

#   def self.default_price
#     DEFAULT_PRICE
#   end

#   def default_price
#     DEFAULT_PRICE
#   end
# end
# p Product.default_price
# product = Product.new
# # p product.price
# p product.default_price
# class User
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end

# #   def hello
# #     "hello, I am #{name}"
# #   end

# #   def hi
# #     "Hi, I am #{self.name}"
# #   end

# #   def my_name
# #     "My name is #{@name}"
# #   end
# # end
# user = User.new("Alice")
# # p user.hello
# # p user.hi
# # p user.my_name
# # class Foo
# #   # p "クラス構文の直下のself: #{self}"

# #   def self.bar
# #     p "クラスメソッドないのself: #{self}"
# #   end

#   def baz
#     p "インスタンスメソッド内のself: #{self}"
#   end
# end
# p Foo.bar
# foo = Foo.new
# p foo.baz
# class Product
#   attr_reader :name, :price

#   def initialize(name, price)
#     @name = name
#     @price = price
#   end

# #   def self.format_price(price)
# #     "#{price}円"
# #   end

# #   def to_s
# #     # formatted_price = self.class.format_price(price)は同じ意味となる
# #     formatted_price = Product.format_price(price)
# #     "name: #{name}, price: #{formatted_price}"
# #   end
# # end
# product = Product.new("A great movie", 1000)
# # p product.to_s
# user = User.new(:name)
# # p user.class
# # p user.instance_of?(User)
# # p user.instance_of?(String)
# # p user.instance_of?(Object)
# # p user.is_a?(User)
# p user.is_a?(Object)
# p user.is_a?(BasicObject)
# p user.is_a?(String)
# class Product
#   attr_reader :name, :price

#   def initialize(name, price)
#     @name = name
#     @price = price
#   end

# # Objectクラスのto_sメソッドをオーバーライド
#   def to_s
#     "name: #{name}, price: #{price}"
#   end
# end

# class DVD < Product
#   attr_reader :running_time

#   def initialize(name, price, running_time)
#     # @name = name
#     # @price = price
#     super(name, price)
#     @running_time = running_time
#   end

#   # Productクラスのto_sメソッドをオーバーライド
#   def to_s
#     # "name: #{name}, price: #{price}, running_time: #{running_time}"
#     "#{super}, running_time: #{running_time}"
#   end
# end
# product = Product.new('A great movie', 1000)
# # p product.name
# # p product.price
# p product.to_s
# dvd = DVD.new("A great movie", 1000, 120)
# # p dvd.name
# # p dvd.price
# # p dvd.running_time
# p dvd.to_s
# class Foo
#   def self.hello
#     "hello"
#   end
# end

# class Bar < Foo
# endm
# p Foo.hello
# p Bar.hello
# class User
# # デフォルトではpublicメソッドとなる
#   def hello
#     #{self.name}ではエラーが発生する
#     "hello, #{name}"
#   end

#   private

#   # privateメソッド
#   def name
#     "Hel"
#   end
# end

# class Product
#   private
#   def name
#     'A great movie'
#   end
# end

# class DVD < Product
#   def to_s
#     "name:#{name}"
#   end
# end

# dvd = DVD.new
# p dvd.to_s

# class User
#   attr_reader :name

#   def initialize(name, weight)
#     @name = name
#     @weight = weight
#   end

#   def heavier_than?(other_user)
#     other_user.weight < @weight
#   end

#   protected

#   def weight
#     @weight
#   end
# end

# alice = User.new('alice', 50)
# bob = User.new('bob', 70)

# p alice.heavier_than?(bob)
# p bob.heavier_than?(alice)
# p alice.weight

# class Parent
#   def initialize
#     @first = 1
#     @second = 2
#   end

#   def number
#     "#{@first}:#{@second}"
#   end
# end

# class Child < Parent
#   def initialize
#     super
#     @hour = 6
#     @minute = 30
#     @second = 59
#   end

#   def time
#     "#{@hour}:#{@minute}:#{@second}"
#   end
# end

# parent = Parent.new
# p parent.number

# child = Child.new
# p child.time
# p child.number

# class Product
#   DEFAULT_PRICE = 0
#   DEFAULT_PRICE = 100
#   # private_constant :DEFAULT_PRICE
# end

# p Product::DEFAULT_PRICE

# class Product
#   NAME = 'A product'
#   SOME_NAMES = ['foo', 'bar', 'baz'].freeze
#   SOME_PRICES = {'foo' => 10, 'bar' => 20, 'baz' => 30}
# end
# Product::NAME.upcase!
# p Product::NAME
# Product::SOME_NAMES << 'hoge'
# p Product::SOME_NAMES

# class Product
#   # クラスインスタンス変数
#   @name = "Product"

#   def self.name
#     # クラスインスタンス変数
#     @name
#   end

#   def initialize(name)
#     # インスタンス変数
#     @name = name
#   end

#   def name
#     # インスタンス変数
#     @name
#   end
# end
# # p Product.name
# # product = Product.new('good')
# # p product.name
# # p Product.name
# class DVD < Product
#   @name = 'DVD'

#   def self.name
#     @name
#   end

#   def upcase_name
#     @name.upcase
#   end
# end

# p Product.name
# p DVD.name
# p product = Product.new('A great movie')
# p product.name
# dvd = DVD.new('An awesome film')
# p dvd.name
# p dvd.upcase_name
# p Product.name
# p DVD.name

# $program_name = 'Awesome program'
# class Program
#   def initialize(name)
#     $program_name = name
#   end

#   def self.name
#     $program_name
#   end

#   def name
#     $program_name
#   end
# end
# p Program.name
# program = Program.new('super')
# p program.name
# p Program.name
# p $program_name

# class MyString < String
# end
# s = MyString.new('hello')
# p s
# p s.class

# class MyArray < Array
# end
# a = MyArray.new()
# a << 1
# a << 2
# p a
# p a.class

# 独自メソッドの追加
# class String
#   def shuffle
#     chars.shuffle.join
#   end
# end
# s = 'Hello, I am Alice'
# p s.shuffle
# p s.shuffle

# 既存のメソッドの上書き
# class User
#   def initialize(name)
#     @name = name
#   end

#   def hello
#     "Hello, #{@name}"
#   end
# end
# p user = User.new('Alice')
# p user.hello
# class User
#   def hello
#     "#{@name}さん、こんにちは"
#   end
# end
# p user.hello

# 特定オブジェクトへのメソッド追記
# alice = 'I am Alice'
# bob = 'I am Bob'
# def alice.shuffle
#   chars.shuffle.join
# end
# p alice.shuffle
# p bob.shuffle   エラー

# 特異メソッドによる定義
# alice  = 'I am Alice'
# class << alice
#   def shuffle
#     chars.shuffle.join
#   end
# end
# p alice.shuffle

# 特異メソッドとクラスメソッド
# クラスメソッド
# class User
#   def self.hello
#     'hello'
#   end

#   class << self
#     def hi
#       'Hi'
#     end
#   end
# end
# 特異メソッド
# alice =  'I am alice'
# def alice.hello
#   'hello'
# end

# class << alice
#   def hi
#     'Hi'
#   end
# end

# class User
# end
# クラス構文の外部にクラスメソッドを定義
# def User.hello
#   'hello'
# end
# クラス構文の外部にクラスメソッドを定義
# class << User
#   def hi
#     'hi'
#   end
# end

# ダックタイピング
# def display_name(object)
#   puts "Name is <<#{object.name}>>"
# end
# class User
#   def name
#     'alice'
#   end
# end
# class Product
#   def name
#     'A great movie'
#   end
# end
# user = User.new
# product = Product.new
# p display_name(user)
# p display_name(product)

# メソッドを持っているかの確認
# p user.respond_to?(:name) true
# p user.respond_to?(:hi)   false




























































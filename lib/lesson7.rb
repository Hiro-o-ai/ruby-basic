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

class Product
  DEFAULT_PRICE = 0
end

p Product::DEFAULT_PRICE



















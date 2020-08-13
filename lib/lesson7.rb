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
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
users = []
users << User.new('Alice','Ruby', 20)
users << User.new('Bob', 'Python', 30)
# users.each do |user|
#   p "氏名: #{user.full_name}、 年齢: #{user.age}"
# end
# p users[0].first_name
alice = User.new('Alice', 'Ruby', 20)
bob = User.new('Bob', 'Python', 30)
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
class User
# nameとname=(value)メソッドと同じ効果を持つ
  attr_accessor :name, :age
# 読み込み専用に変えたいときはattr_readerメソッドを使用
# 書き込み専用にしたいときはattr_writerを使用する
  def initialize(name)
    @name = name
    # @age = age
  end

# 外部から@nameを参照するためのメソッド
  # def name
  #   @name
  # end

# 外部から@nameを変更するためのメソッド
  # def name=(value)
  #   @name = value
  # end

  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    # shuffled_name = @name.chars.shuffle.join
    "hello, i am #{@name}"
  end
end
user = User.new("alice")
# p user.hello
alice = User.new('Alice')
# p alice.hello
bob = User.new('Bob')
# p bob.hello
names = ['Alice', 'Bob', 'Carol']
users = User.create_users(names)
users.each do |user|
  p user.hello
end







































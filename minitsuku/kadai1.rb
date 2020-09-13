# class Library
#   attr_accessor :library

#   def initialize
#     @library = []
#   end

#   def to_s
#     "hello"
#   end
# end

# class Book < Library
#   attr_accessor :book, :detail

#   def initialize(detail)
#     @detail = detail
#     @book = []
#     @book << "title: #{@detail[:author]}"
#     @book << "author: #{@detail[:author]}"
#     library = @detail[:library]
#     library.library.append(@book)
#   end
# end

# class Library
#   def initialize
#     @books = []
#   end
 
#   def <<(book)
#     @books << book
#   end
 
#   def to_s
#     puts "Library contents:"
#     @books.join("\n")
#   end
# end
 
# class Book
#   attr_accessor :author, :title
#   def initialize(args)
#     @author = args[:author]
#     @title  = args[:title]
#     args[:library] << self
#   end
 
#   def to_s
#     "Title: " + @title + ", Author: " + @author
#   end
# end

# class Library
# 初期化のinitialize
#   def initialize
#     @library = []
#   end

#   def <<(book)
#     @library << book
#   end

#   def to_s
#     puts 'Library contents:'
#     @library.join("\n")
#   end
# end

# class Book
#   attr_accessor :title, :author

#   def initialize(detail)
#     @author = detail[:author]
#     @title = detail[:title]
#     detail[:library] << self
#   end

#   def to_s
#     "Title: " + @title + ", Author: " + @author
#   end
# end

# my_library = Library.new
# book = Book.new(:author => "Herman Melville", :title => "Moby-Dick", :library => my_library)
# Book.new(:author => "Hans Christian Andersen", :title => "The Ugly Duckling", :library => my_library)
# puts my_library


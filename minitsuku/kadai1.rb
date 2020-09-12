class Library
  def
end

class Book
  attr_accessor :author, :title, :library

  def initialize(:author, :title, :library)
    @author = :author
    @title = :title
    @library = :library
  end

end


my_library = Library.new
Book.new(:author => "Herman Melville", :title => "Moby-Dick", :library => my_library)
Book.new(:author => "Hans Christian Andersen", :title => "The Ugly Duckling", :library => my_library)
puts my_library
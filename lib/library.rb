# Library class
class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book.shift
  end

  def include?(title)
    @books.map(&:title).include?(title)
  end

  def card_catalogue
    @books.sort_by!(&:author_last_name)
  end
end

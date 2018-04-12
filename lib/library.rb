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

  def find_by_author(author_name)
    names = author_name.split(' ')
    collection = @books.find_all do |book|
      book.author_first_name == names[0]
    end.compact
    collection.group_by(&:title)
  end

  def find_by_publication_date(date)
    collection = @books.find_all do |book|
      book.publication_date == date
    end.compact
    collection.group_by(&:title)
  end
end

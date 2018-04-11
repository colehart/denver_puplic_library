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
    name_ary = author_name.split(' ')
    book_ary = @books.map do |book|
      book if book.author_first_name == name_ary[0]
    end.compact
    book_ary.group_by(&:title)
  end

  def find_by_publication_date(date)
    book_ary = @books.map do |book|
      book if book.publication_date == date
    end.compact
    book_ary.group_by(&:title)
  end
end

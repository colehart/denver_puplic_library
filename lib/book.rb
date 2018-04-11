# Book class
class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title,
              :publication_date

  def initialize(book_hash = Hash.new(0))
    @author_first_name = book_hash[:author_first_name]
    @author_last_name  = book_hash[:author_last_name]
    @title             = book_hash[:title]
    @publication_date  = book_hash[:publication_date]
  end
end

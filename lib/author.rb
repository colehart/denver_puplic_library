require './lib/book'
# Author class
class Author
  attr_reader :first_name,
              :last_name

  def initialize(author_hash = Hash.new(0))
    @first_name = author_hash[:first_name]
    @last_name  = author_hash[:last_name]
  end

  def add_book(title, publication_date)
    Book.new(author_first_name: @first_name,
             author_last_name: @last_name,
             title: title,
             publication_date: publication_date)
  end
end

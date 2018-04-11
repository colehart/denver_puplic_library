# Author class
class Author
  attr_reader :first_name,
              :last_name,
              :books

  def initialize(author_hash = Hash.new(0))
    @first_name = author_hash[:first_name]
    @last_name  = author_hash[:last_name]
    @books      = []
  end
end

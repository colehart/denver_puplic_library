require './test/test_helper'
require './lib/author'

class AuthorTest < Minitest::Test
  def setup
    @author = Author.new(first_name: 'Charlotte',
                         last_name: 'Bronte')
  end

  def test_it_exists
    assert_instance_of Author, @author
  end

  def test_it_has_attributes
    assert_equal 'Charlotte', @author.first_name
    assert_equal 'Bronte', @author.last_name
  end

  def test_add_books_adds_new_instance_of_book
    book = @author.add_book('Jane Eyre', 'October 16, 1847')
    assert_instance_of Book, book
    assert_equal 'Charlotte', book.author_first_name
    assert_equal 'Bronte', book.author_last_name
    assert_equal 'Jane Eyre', book.title
    assert_equal '1847', book.publication_date
  end

  def test_can_add_another_instance_of_book
    book = @author.add_book('Villette', '1853')
    assert_instance_of Book, book
    assert_equal 'Charlotte', book.author_first_name
    assert_equal 'Bronte', book.author_last_name
    assert_equal 'Villette', book.title
    assert_equal '1853', book.publication_date
  end
end

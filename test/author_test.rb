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

  def test_starts_with_no_books
    assert_empty @author.books
  end

  def test_add_books_adds_new_instance_of_book
    @author.add_book('Jane Eyre', 'October 16, 1847')
    assert_instance_of Book, @author.books[0]
    assert_equal 'Charlotte', @author.books[0].author_first_name
    assert_equal 'Bronte', @author.books[0].author_last_name
    assert_equal 'Jane Eyre', @author.books[0].title
    assert_equal 'October 16, 1847', @author.books[0].publication_date
  end

  def test_can_add_another_instance_of_book
    @author.add_book('Jane Eyre', 'October 16, 1847')
    @author.add_book('Villette', '1853')
    assert_instance_of Book, @author.books[1]
    assert_equal 'Charlotte', @author.books[1].author_first_name
    assert_equal 'Bronte', @author.books[1].author_last_name
    assert_equal 'Villette', @author.books[1].title
    assert_equal '1853', @author.books[1].publication_date
  end
end

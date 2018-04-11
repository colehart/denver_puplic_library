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
end

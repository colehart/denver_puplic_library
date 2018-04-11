require './test/test_helper'
require './lib/library'
require './lib/author'

class LibraryTest < Minitest::Test
  def setup
    @dpl = Library.new
    @charlotte_bronte = Author.new(first_name: 'Charlotte',
                                   last_name: 'Bronte')
    @jane_eyre = @charlotte_bronte.add_book('Jane Eyre', 'October 16, 1847')
    @villette  = @charlotte_bronte.add_book('Villette', '1853')

    @harper_lee  = Author.new(first_name: 'Harper',
                              last_name: 'Lee')
    @mockingbird = @harper_lee.add_book('To Kill a Mockingbird', 'July 11, 1960')
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_starts_with_no_books
    assert_empty @dpl.books
  end

  def test_it_can_add_books_to_collection
    @dpl.add_to_collection(@jane_eyre)
    assert_instance_of Book, @dpl.books[0]
    assert_equal 'Charlotte', @dpl.books[0].author_first_name
    assert_equal 'Bronte', @dpl.books[0].author_last_name
    assert_equal 'Jane Eyre', @dpl.books[0].title
    assert_equal 'October 16, 1847', @dpl.books[0].publication_date
  end

  def test_it_can_add_more_books_to_collection
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert_instance_of Book, @dpl.books[1]
    assert_equal 'Harper', @dpl.books[1].author_first_name
    assert_instance_of Book, @dpl.books[2]
    assert_equal 'Villette', @dpl.books[2].title
  end

  def test_it_can_lookup_books_in_collection
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)

    assert @dpl.include?('To Kill a Mockingbird')
    refute @dpl.include?('A Connecticut Yankee in King Arthur\'s Court')
  end

  def test_it_can_return_sorted_array_by_author_last_name
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    @dpl.card_catalogue
    assert_equal 'Bronte', @dpl.books[0].author_last_name
    assert_equal 'Lee', @dpl.books[2].author_last_name
  end

  def test_it_can_find_by_author_name
    @dpl.add_to_collection(@jane_eyre)
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@villette)
    assert_instance_of Hash, @dpl.find_by_author('Charlotte Bronte')
    assert_equal ['Jane Eyre', 'Villette'], @dpl.find_by_author('Charlotte Bronte').keys
  end
end

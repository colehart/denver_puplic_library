require './test/test_helper'
require './lib/library'

class LibraryTest < Minitest::Test

  def setup
    @library = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @library
  end
end

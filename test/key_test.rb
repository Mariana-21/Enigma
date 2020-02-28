require './lib/key'
require 'minitest/autorun'
require 'minitest/pride'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_has_key_num
    key = Key.new
    
    assert_equal true, key.
  end

end

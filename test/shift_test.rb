require './test/test_helper'
require './lib/enigma'
require './lib/shift'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new('020320', '15234')
  end

  def test_it_exsits
    assert_instance_of Shift, @shift
  end

  def test_it_has_attributes
    @shift.stubs(:rand).returns(15234)
    @shift.stubs(:date).returns('020320')

    assert_equal '15234', @shift.key
    assert_equal '020320', @shift.date
  end

  def test_it_can_get_offset_key

    assert_equal [2, 4, 0, 0], @shift.offset_key('020320')
  end

  def test_it_can_put_key_numbers_in_pairs

    assert_equal [15, 52, 23, 34], @shift.key_pairs
  end

  def test_it_can_combine_date_and_offset

    assert_equal [17, 56, 23, 34], @shift.date_and_offset
  end

  def test_it_can_rotate

    assert_equal 17, @shift.rotate_shift
  end
end

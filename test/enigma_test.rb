
require './test/test_helper'
require './lib/enigma'
require './lib/shift'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
    @shift = Shift.new('020320', '15234')
    @act_encrypt = @enigma.encrypt("hello world", @shift.key, @shift.date)
  end
  def test_it_exsits

    assert_instance_of Enigma, @enigma
  end

  def test_encrypt

    expected = {
      encryption: "aojphjuskvb",
      key: @shift.key,
      date: @shift.date
    }

    assert_equal expected, @enigma.encrypt("hello world", @shift.key, @shift.date)
  end

  def test_it_can_encryption

    assert_equal "aojphjuskvb", @enigma.encryption("hello world")
  end
  #
  def test_decryption
    assert_equal "hello world", @enigma.decryption("aojphjuskvb")
  end
end

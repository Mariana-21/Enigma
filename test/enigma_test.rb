require './lib/enigma'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaTest < Minitest::Test

  def test_it_exsits
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt

    enigma = Enigma.new
    skip
    expected = {
      encryption: "keder ohulw",
      key: "10234",            #"02715"
      date: "280220"
    }

    assert_equal expected, enigma.encrypt("hello world", "280220", "10234")
  end

  def test_it_can_get_date
    enigma = Enigma.new

    assert_equal "280220", enigma.date
  end

  def test_it_can_get_key
    enigma = Enigma.new

    assert_equal "10234", enigma.key
  end

  def test_it_can_get_offset_key
    enigma = Enigma.new

    assert_equal [8, 4, 0, 0], enigma.offset_key("280220")
  end
end

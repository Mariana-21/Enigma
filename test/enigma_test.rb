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
    expected = {
      encryption: "keder ohulw",
      key: "01234",            #"02715" 
      date: "280220"
    }

    assert_equal expected, enigma.encrypt("hello world", "280220", "01234")
  end

  def test_it_can_get_date
    enigma = Enigma.new

    assert_equal "280220", enigma.date
  end

  def test_it_can_get_key
    enigma = Enigma.new

    assert_equal "01234", enigma.key
  end
end

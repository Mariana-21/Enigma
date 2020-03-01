require './lib/enigma'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'

class EnigmaTest < Minitest::Test

  def test_it_exsits
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt
    date = Time.now.strftime("%d%m%y")
    enigma = Enigma.new
    skip
    expected = {
      encryption: "keder ohulw",
      key: "10234",            #"02715"
      date: date
    }

    assert_equal expected, enigma.encrypt("hello world", date, "10234")
  end

  def test_it_can_get_date
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal date, enigma.date
  end

  def test_it_can_get_key
    date = Time.now.strftime("%d%m%y")
    enigma = Enigma.new

    assert_equal "10234", enigma.key
  end

  def test_it_can_get_offset_key
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal [8, 4, 0, 0], enigma.offset_key(date)
  end

  def test_shift
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    # expected = {
    #   "A"=>1,
    #   "B"=>0,
    #   "C"=>2,
    #   "D"=>3,
    #   "E"=>4
    # }

    assert_equal "TBD", enigma.shift
  end
end

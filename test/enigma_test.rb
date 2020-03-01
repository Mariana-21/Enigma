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

    expected = {
      encryption: "C GGJVRJMGZ",
      key: "15234",            #"02715"
      date: date
    }

    assert_equal expected, enigma.encrypt("hello world", date, "15234")
  end

  def test_it_can_get_date
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal date, enigma.date
  end

  def test_it_can_get_key
    date = Time.now.strftime("%d%m%y")
    enigma = Enigma.new

    assert_equal "15234", enigma.key
  end

  def test_it_can_get_offset_key
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal [2, 4, 0, 0], enigma.offset_key(date)
  end

  def test_shift_nums
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    # expected = {
    #   "A"=>15,
    #   "B"=>52,
    #   "C"=>23,
    #   "D"=>34
    # }

    assert_equal [15, 52, 23, 34], enigma.shift_nums
  end

  def test_it_can_get_shift
    skip
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    expected = {
      "A"=>17,
      "B"=>56,
      "C"=>23,
      "D"=>34
    }

    assert_equal expected, enigma.shift
  end

  def test_it_can_encode
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal "C GGJVRJMGZ", enigma.encode("hello world", 5)
  end
end

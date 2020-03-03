
require './test/test_helper'
require './lib/enigma'
require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exsits
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_encrypt
    skip
    date = Time.now.strftime("%d%m%y")
    enigma = Enigma.new

    expected = {
      encryption: enigma.encrypt("hello world"),
      key: "15234",            #"02715"
      date: date
    }

    assert_equal expected, enigma.encrypt("hello world", "15234", date)
  end

  def test_it_can_get_date
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal date, enigma.date
  end

  def test_it_can_get_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(15234)
    date = Time.now.strftime("%d%m%y")

    assert_equal "15234", enigma.random_key
  end

  def test_it_can_get_offset_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(15234)
    date = Time.now.strftime("%d%m%y")

    assert_equal [2, 4, 0, 0], enigma.offset_key(date)
  end

  def test_shift_nums
    enigma = Enigma.new
    enigma.stubs(:rand).returns(15234)
    date = Time.now.strftime("%d%m%y")

    assert_equal [15, 52, 23, 34], enigma.shift_nums
  end

  def test_it_can_get_shift
    enigma = Enigma.new
    enigma.stubs(:rand).returns(15234)
    date = Time.now.strftime("%d%m%y")

    assert_equal [17, 56, 23, 34], enigma.shift
  end

  def test_it_can_encryption
    enigma = Enigma.new
    enigma.stubs(:rand).returns(15234)
    date = Time.now.strftime("%d%m%y")

    assert enigma.encryption("hello world")
  end

  def test_decryption
    enigma = Enigma.new
    enigma.stubs(:rand).returns(15234)
    date = Time.now.strftime("%d%m%y")
    act_encrypt = enigma.encrypt("hello world")

    assert_equal "hello world", enigma.decryption(act_encrypt[:encryption])
  end

  def test_it_can_rotate
    skip
    skip
    enigma = Enigma.new
    date = Time.now.strftime("%d%m%y")

    assert_equal 17, enigma.rotate_shift
  end
end

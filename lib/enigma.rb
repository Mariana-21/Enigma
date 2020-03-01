class Enigma

  def initialize
    @num1 = 0
    @num2 = 0
    @num3 = 0
    @num4 = 0
  end

  def encrypt(sentence, date, key)
    encrypt_hash = {encryption: encode("hello world", 5), key: key, date: date}
  end

  def date
    date = Time.now.strftime("%d%m%y")
  end

  def key
    key_arr = [1,5,2,3,4]
      key_arr.map!(&:to_s).join
  end

  def offset_key(date)
    square_date = date.to_i ** 2
    offset = square_date.to_s.split(//)
    offset_array = offset[5..8].map(&:to_i)
    # require "pry"; binding.pry
  end

  def shift_nums
     act_key = key.split(//).map(&:to_i)
     numbers =
      @num1 = act_key[0..1].join.to_i,
      @num2 = act_key[1..2].join.to_i,
      @num3 = act_key[2..3].join.to_i,
      @num4 = act_key[3..4].join.to_i
    # require "pry"; binding.pry
  end

  def shift
    a = shift_nums[0] += offset_key(date)[0]
    b = shift_nums[1] += offset_key(date)[1]
    c = shift_nums[2] += offset_key(date)[2]
    d = shift_nums[3] += offset_key(date)[3]
    # require "pry"; binding.pry
  end

  def encode(sentence, shift)
    all_letters = ("A".."Z").to_a << " "
    sentence.upcase.chars.map do |letter|
      if all_letters.include? (letter)
        index_of_letter = all_letters.find_index(letter)
        letter = all_letters[index_of_letter - shift]
      else
        letter
      end
    end.join
  end
end

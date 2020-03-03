class Enigma

  def initialize
    @final_shifts = shift
  end

  def encrypt(sentence,  key = random_key, date =  Time.now.strftime("%d%m%y"))
    encrypt_hash = {encryption: encryption(sentence), key: "15234", date: date}
  end

  def date
    date = Time.now.strftime("%d%m%y")
  end

  def random_key
    rand(0..99999).to_s.rjust(5, '0')
  end

  def offset_key(date)
    square_date = date.to_i ** 2
    offset = square_date.to_s.split(//)
    offset_array = offset[5..8].map(&:to_i)
    # require "pry"; binding.pry
  end

  def shift_nums
     act_key = random_key.split(//).map(&:to_i)
     numbers =
      act_key[0..1].join.to_i,
      act_key[1..2].join.to_i,
      act_key[2..3].join.to_i,
      act_key[3..4].join.to_i
    # require "pry"; binding.pry
  end

  def shift
    [ shift_nums[0] += offset_key(date)[0],
      shift_nums[1] += offset_key(date)[1],
      shift_nums[2] += offset_key(date)[2],
      shift_nums[3] += offset_key(date)[3]]
    # require "pry"; binding.pry
  end

  def rotate_shift
    rotate_shift_key = @final_shifts[0]
    @final_shifts.rotate!
    rotate_shift_key
  end

  def encryption(message)
    all_letters = ("A".."Z").to_a << " "
    # require "pry"; binding.pry
    message.upcase.chars.map do |letter|
      if all_letters.include? (letter)
        index_of_letter = all_letters.find_index(letter)
        letter = all_letters[(index_of_letter - rotate_shift) % 27]
      else
        letter
      end
    end.join.downcase
  end

  def decryption(message)
    all_letters = ("A".."Z").to_a << " "
    # require "pry"; binding.pry
    message.upcase.chars.map do |letter|
      if all_letters.include? (letter)
        index_of_letter = all_letters.find_index(letter)
        letter = all_letters[(index_of_letter + rotate_shift) % 27]
      else
        letter
      end
    end.join.downcase
  end
end

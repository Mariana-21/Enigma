require './lib/shift'

class Enigma

  def initialize
    @shift = Shift.new('020320', '15234')
  end
  def encrypt(sentence,  key = @shift.key, date = @shift.date)
    encrypt_hash = {encryption: encryption(sentence), key: "15234", date: date}
  end

  def encryption(message)
    all_letters = ("A".."Z").to_a << " "
    message.upcase.chars.map do |letter|
      if all_letters.include? (letter)
        index_of_letter = all_letters.find_index(letter)
        letter = all_letters[(index_of_letter - @shift.rotate_shift) % 27]
      else
        letter
      end
    end.join.downcase
  end

  def decrypt(sentence,  key = @shift.key, date = @shift.date)
    encrypt_hash = {decryption: decryption(sentence), key: "15234", date: date}
  end

  def decryption(message)
    all_letters = ("A".."Z").to_a << " "
    message.upcase.chars.map do |letter|
      if all_letters.include? (letter)
        index_of_letter = all_letters.find_index(letter)
        letter = all_letters[(index_of_letter + @shift.rotate_shift) % 27]
      else
        letter
      end
    end.join.downcase
  end
end

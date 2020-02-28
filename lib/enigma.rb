class Enigma


  def encrypt(message, date, key)
      encrypt_hash = {encryption: "TBD", key: key, date: date}
  end

  def date
    date = Time.now.strftime("%d%m%y")
  end

  def key
    key_arr = [1,0,2,3,4]
      key_arr.map!(&:to_s).join
  end

  def offset_key(date)
    square_date = date.to_i ** 2
    offset = square_date.to_s.split(//)
    offset_array = offset[7..10].map(&:to_i)
    # require "pry"; binding.pry
  end
end

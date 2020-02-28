class Enigma


  def encrypt(message, date, key)
      encrypt_hash = {encryption: "TBD", key: key, date: date}
  end

  def date
    date = Time.now.strftime("%d%m%y")
  end

  def key
    key_arr = [0,1,2,3,4]
    # require "pry"; binding.pry
      offset = key_arr.map!(&:to_s).join
  end
end

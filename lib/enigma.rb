class Enigma


  def encrypt(message, date, key)
      encrypt_hash = {encryption: "TBD", key: "TBD", date: date}
  end

  def date
    date = Time.now.strftime("%d%m%y")
  end

  def key
    require "pry"; binding.pry
  end
end

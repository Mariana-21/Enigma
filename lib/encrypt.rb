require './lib/enigma'
@enigma = Enigma.new
message = File.open(ARGV[0], "r")

incoming_text = message.read

encrypt = @enigma.encrypt(incoming_text, '15234', '020320')[:encryption]
key = @enigma.encrypt(incoming_text, '15234', '020320')[:key]
date = @enigma.encrypt(incoming_text, '15234', '020320')[:date]
new_message = "created #{encrypt}with the key #{key} and the date #{date}"

encrypted_message = File.open(ARGV[1], "w")

encrypted_message.write(new_message)

encrypted_message.close
puts new_message

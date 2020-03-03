require './lib/enigma'
@enigma = Enigma.new
encrypted = File.open(ARGV[0], "r")

incoming_text = encrypted.read

decrypt = @enigma.decrypt(incoming_text, '15234', '020320')[:decryption]
key = @enigma.decrypt(incoming_text, '15234', '020320')[:key]
date = @enigma.decrypt(incoming_text, '15234', '020320')[:date]
new_message = "created #{decrypt}with the key #{key} and the date #{date}"

decrypted_message = File.open(ARGV[1], "w")

decrypted_message.write(decrypt)

decrypted_message.close
puts new_message

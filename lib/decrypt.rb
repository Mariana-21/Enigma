require './lib/enigma'
@enigma = Enigma.new
encrypted = File.open(ARGV[0], "r")

incoming_text = encrypted.read

key_argv = ARGV[2]
date_argv = ARGV[3]

decrypt = @enigma.decrypt(incoming_text, key_argv, date_argv)[:decryption]
key = @enigma.decrypt(incoming_text, key_argv, date_argv)[:key]
date = @enigma.decrypt(incoming_text, key_argv, date_argv)[:date]
new_message = "created #{decrypt}with the key #{key_argv} and the date #{date_argv}"

decrypted_message = File.open(ARGV[1], "w")

decrypted_message.write(decrypt)

decrypted_message.close
puts new_message

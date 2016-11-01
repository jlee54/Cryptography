require 'openssl'
require 'digest/sha2'
require 'base64'

puts "These are our command line arguments"
v1 = ARGV[0]
v2 = ARGV[1]
v3 = ARGV[2]
puts v1
puts v2
puts v3
puts

arg3 = v3
key = String.new
0.upto(arg3.length-1) do |bits|
  (arg3[bits].hex.to_s(2).rjust(arg3[bits].size*4, '0')).each_char do |c|
    key << c
  end
end

#key.chars.each_slice(2).map(&:join)

#Choose a 256 bit Digest, but it won't matter in the overall scope
digest = Digest::SHA256.new
digest.update(key)
key = digest.digest

#puts "Our key base 64"
key64 = [key].pack('m')

#The static iv value we will use across programs
#iv = OpenSSL::Cipher::Cipher.new("AES-128-CBC").random_iv
iv = '3�m���쀈��'

if v1 == '-e'
  aes = OpenSSL::Cipher::AES128.new(:CBC)
  aes.encrypt
  aes.key = key
  aes.iv = iv
  
  cipher = aes.update(v2)
  cipher << aes.final
  
  puts "Our Encrypted data in base64"
  puts v2
  v2 = [cipher].pack('m')
  puts v2
  puts v2.unpack('m')[0]
end

if v1 == '-d'
  decode_cipher = OpenSSL::Cipher::Cipher.new("AES-128-CBC")
  decode_cipher.decrypt
  decode_cipher.key = key
  decode_cipher.iv = iv
  plain = decode_cipher.update(v2.unpack('m')[0])
  plain << decode_cipher.final
  puts "Decrypted Text"
  puts plain
end


require 'base64'
require './helper_methods'


ary1 = String.new
File.open("data/Ciphertext1.txt", "r") do |f|
  f.each_line do |line|
    ary1 << line
  end
end

ary2 = String.new
File.open("data/Ciphertext2.txt", "r") do |f|
  f.each_line do |line|
    ary2 << line
  end
end
ary2.downcase!

alphabet = Hash.new(0)
("a".."z").each do |c|
    alphabet[c] = 1
end

puts "plaintext of ciphertext1"
solve_ciphertext1(ary1, alphabet)
puts


#vigenere_find_key_probable_key_length(alphabet, ary2)         #Chosen 5

hash1 = vigenere_count_freq_at_letter_interval(ary2, alphabet, 5, 0)  #Chosen z, shift of 5, so G is now in key
hash2 = vigenere_count_freq_at_letter_interval(ary2, alphabet, 5, 1)  #so on...
hash3 = vigenere_count_freq_at_letter_interval(ary2, alphabet, 5, 2)
hash4 = vigenere_count_freq_at_letter_interval(ary2, alphabet, 5, 3)
hash5 = vigenere_count_freq_at_letter_interval(ary2, alphabet, 5, 4)
#end up with grimm

grimm = ['g','r','i','m','m'] 

puts "plaintext of ciphertext2"
solve_ciphertext2(ary2, alphabet, grimm)
puts




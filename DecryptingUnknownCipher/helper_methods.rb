
#Counts and sorts by most occuring character
def frequency(arr)
  hash = Hash.new(0)
  arr.each_char do |c|
    hash[c] += 1 unless c == " " #used to filter the space
  end
  print hash.sort {|a1,a2| a2[1]<=>a1[1]}
end

#Shifts text n letters in relation to alphabet
def shift_by(arr, n)
  letters = ('a'..'z').to_a
  arr.chars.map {|x| letters.include?(x.downcase) ? 
     letters[letters.find_index(x.downcase) + n - letters.size] : x}.join
end

#Shows all possible shifts of string array
def shift_print(arr)
  (0).upto(25) do |x|
      #only looks at first 50 characters
    puts shift_by(arr[0...50], x)
  end
end

def solve_ciphertext1(ary1, alphabet)
  
  alph2 = Hash.new(0)
  alph2['l'] = 't'
  alph2['u'] = 'h'
  alph2['a'] = 'e'
  alph2['m'] = 'r'
  alph2['y'] = 'y'
  alph2['b'] = 's'
  alph2['w'] = 'o'
  alph2['s'] = 'f'
  alph2['g'] = 'a'
  alph2['h'] = 'i'
  alph2['p'] = 'v'
  alph2['q'] = 'u'
  alph2['c'] = 'w'
  alph2['i'] = 'd'
  alph2['k'] = 'c'
  alph2['j'] = 'n'
  alph2['d'] = 'g'
  alph2['o'] = 'l'
  alph2['e'] = 'b'
  alph2['n'] = 'p'
  alph2['r'] = 'k'
  alph2['f'] = 'm'
  alph2['v'] = 'q'
  alph2['t'] = 'j'
  alph2['z'] = 'x'
  
  alph2upp = alph2.clone
  alph2upp.each { |k, v| alph2upp[k] = v.upcase } 
  
  output_arr = String.new
  ary1.each_char do |p|
      if alph2[p] != 0
        output_arr << alph2[p]
      elsif alph2upp[p.downcase] !=0
        output_arr << alph2upp[p.downcase]
      else
        output_arr << p
      end
  end
  puts output_arr
end

#finds most common sub-string
def most_common(string)
  words = string.downcase.tr(",.?!",'').split(' ')
  counts = words.each_with_object(Hash.new(0)) { |e, h| h[e] += 1 }
  max_quantity = counts.values.max
  counts.select { |k, v| v == max_quantity }.keys
end

#rotates cipher text and counts matching characters between original ciphertext and rotated one
def vigenere_find_key_probable_key_length(alphabet, ary2)
  count = 0
  i = 0
  0.upto(50) do |r|
    temp = ary2[0...ary2.length].chars.rotate(r).join
    #puts temp
    temp.each_char do |x|
      if x == ary2[i] && alphabet[x] != 0
        count +=1
      end
      i +=1
    end
    puts "#{r} and #{count}"
    count = 0
    i=0
  end
end

def vigenere_count_freq_at_letter_interval(ary2, alphabet, interval, start)
  count = 0
  i = 0
  start.step(ary2.length, interval) do |s|
   if alphabet[ary2[s]] != 0
     alphabet[ary2[s]] += 1
   end
  end
  
 # puts alphabet.sort_by {|_key, value| value}.reverse.to_h
  return alphabet.sort_by {|_key, value| value}.reverse.to_h
end

#unused
def english_prob_hash()
  rel_freq_english = Hash.new(0)
  rel_freq_english['a'] = 0.082
  rel_freq_english['b'] = 0.015
  rel_freq_english['c'] = 0.028
  rel_freq_english['d'] = 0.043
  rel_freq_english['e'] = 0.127
  rel_freq_english['f'] = 0.022
  rel_freq_english['g'] = 0.020
  rel_freq_english['h'] = 0.061
  rel_freq_english['i'] = 0.070
  rel_freq_english['j'] = 0.002
  rel_freq_english['k'] = 0.008
  rel_freq_english['l'] = 0.040
  rel_freq_english['m'] = 0.024
  rel_freq_english['n'] = 0.067
  rel_freq_english['o'] = 0.075
  rel_freq_english['p'] = 0.019
  rel_freq_english['q'] = 0.001
  rel_freq_english['r'] = 0.060
  rel_freq_english['s'] = 0.063
  rel_freq_english['t'] = 0.091
  rel_freq_english['u'] = 0.028
  rel_freq_english['v'] = 0.010
  rel_freq_english['w'] = 0.024
  rel_freq_english['x'] = 0.002
  rel_freq_english['y'] = 0.020
  rel_freq_english['z'] = 0.001
end

def solve_ciphertext2(ary2, alphabet, grimm)
  i = 0
  alphabet_numbered = Hash.new(0)
  alphabet_lettered = Hash.new(0)
  ("a".."z").each do |c|
      alphabet_numbered[c] = i
      alphabet_lettered[i] = c
      i +=1
  end
  
  r=0
  output_arr = String.new
  ary2.each_char do |p|
      if alphabet[p] != 0 and p.is_upper? == false
        output_arr << alphabet_lettered[(alphabet_numbered[p] - alphabet_numbered[grimm[r]] ) % 26 ]
        r +=1
      elsif alphabet[p.downcase] !=0
        output_arr << (alphabet_lettered[(alphabet_numbered[p.downcase] - alphabet_numbered[grimm[r]]) % 26]).upcase
        r +=1
      else
        output_arr << p
      end
      if r == 5
        r=0
      end
  end
  puts output_arr
end


#monkey patching String class to check for upper case string letters
class String
  def is_upper?
    self == self.upcase
  end

  def is_lower?
    self == self.downcase
  end
end


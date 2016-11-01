
To run the program from the command line (must be able to install ruby-gems):
$ gem install rake
$ rake 						(will run the rake file)
$ (Or) just run the file directly with ruby Decrypt.rb (which works better)




Ciphertext1 was decoded by using frequency analysis (using the frequency method). I say 'lua' was the most common word in the text, and made the assumption from there that it was 'the'. I slowly kept making assumptions until I got the solution.

Ciphertext2 was first frequency analyzed by comparing the shifted cipher text with the original (vigenere_find_key_probable_key_length). It seemed most likely the key length would be 5 from running the command.
After that I kept making logical guesses to the key (like in the book), using shifts in relation to e with the most frequent ciphertext letters. In the future I would just brute for with all 26*5 options, but here
I just used the already determined key of 'grimm'. There is a bug that capital letters don't show up, didn't have time to fix :(


To run the program from the command line (must be able to install ruby-gems):
$ gem install ruby   (if not already installed, check with `$ ruby --version`)
$ ruby AESexecutable -e '443BC845B4FF3221443BC845B4FF3221' '28AB32AF56D932F356AB32AF66B932F3'   (should run the file)
I tested with various ciphertexts and plaintexts, only agreeing that the program worked when one of the texts could output the other. My program
outputs the ciphertext as ASCII, and requires the ciphertext to be ASCII as an input. I wanted this to be in hex, but didn't have the time to get it
to work. Like DES, the paramters it accepts the -e or -d flag to indicate encryption/decription. Also it accepts a 128 bit input plaintext/ciphertext and 128 bit key.

require 'openssl'
require 'digest/sha2'
require 'base64'

Source 1:  https://ruby-doc.org/stdlib-2.0.0/libdoc/openssl/rdoc/OpenSSL/Cipher.html
	This is the OpenSSL library which houses many cryptography algorithms like AES.
	
Source 2: https://gist.github.com/byu/99651
	My program is heavily based on this code. He showcased the way you can input your own key by using the digest library.
	
Source 3: http://ruby-doc.org/stdlib-2.3.1/libdoc/digest/rdoc/
	My program was able to create key like objects with this library to use as inputs to the AES OpenSSL algorithm
	
Source 4: http://ruby-doc.org/stdlib-2.2.3/libdoc/base64/rdoc/Base64.html
	This allows for encoding and decoding binary data. Requiring this allowed the unpacking of objects.
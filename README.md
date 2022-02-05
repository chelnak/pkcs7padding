# pkcs7padding

This is an experimental package written in [vlang](https://vlang.io/) that implements pkcs#7 padding based on the information in [this Wikipedia article](https://en.wikipedia.org/wiki/Padding_(cryptography)#PKCS#5_and_PKCS#7).

It's primary use is to privide padding support when using the vlib crypto package.

To see some basic examples of how you could use this package, please see the [tests](padding_test.v). Alternatively, for a more comprehensive example that uses AES with [CBC](https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation#Cipher_block_chaining_(CBC)) take a look at this [example](example/cipher_test.v).

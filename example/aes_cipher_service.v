module main

import crypto.aes
import crypto.cipher
import crypto.rand
import pkcs7padding as pkcs7

struct AESCypherService {
	key []byte
}

fn (c &AESCypherService) encrypt(data string) []byte {
	// Generate a fresh iv for each encrypted message
	mut iv := rand.read(16) or { panic('failed to generate random key') }

	mut padded := pkcs7.pad(data.bytes(), aes.block_size)

	block := aes.new_cipher(c.key)
	mode := cipher.new_cbc(block, iv)
	mode.encrypt_blocks(mut padded, padded.clone())
	// Prepend the iv to the encrypted data
	iv << padded

	return iv
}

fn (c &AESCypherService) decrypt(data string) []byte {
	iv := data.bytes()[..aes.block_size]
	mut src := data.bytes()[aes.block_size..]

	block := aes.new_cipher(c.key)
	mut mode := cipher.new_cbc(block, iv)
	mode.decrypt_blocks(mut src, src.clone())
	unpadded := pkcs7.strip(src)

	return unpadded
}

// new_aes_cipher_service creates a new AESCypherService instance.
// The current implementation will use a randomly generated key.
pub fn new_aes_cipher_service() AESCypherService {
	key := rand.read(32) or { panic('failed to generate random key') }

	return AESCypherService{
		key: key
	}
}

module main

fn test_aes_cipher_service() {
	data := 'Hello World!'

	cs := new_aes_cipher_service()

	e := cs.encrypt(data)

	d := cs.decrypt(e.bytestr())

	assert e.bytestr() != data
	assert d.bytestr() == data
	assert d.len == data.bytes().len
}

module pkcs7padding

fn test_padding_for_data_that_is_less_than_block_size() {
	block_size := 16
	data := 'hello'

	padded := pad(data.bytes(), block_size)
	assert padded.len == block_size

	unpadded := strip(padded)
	assert unpadded.len == data.bytes().len
}

fn test_padding_for_data_that_is_equal_to_block_size() {
	block_size := 16
	data := 'hellohellohello!'

	padded := pad(data.bytes(), block_size)
	assert padded.len != block_size
	assert padded.len == 32

	unpadded := strip(padded)
	assert unpadded.len == data.bytes().len
}

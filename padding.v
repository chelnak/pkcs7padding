// A module that implements PKCS#7 padding
// https://en.wikipedia.org/wiki/Padding_(cryptography)#PKCS#5_and_PKCS#7
module pkcs7padding

// strip removes the any padding that has been added to the end of the data
pub fn strip(data []byte) []byte {
	data_length := data.len
	padding_length := int(data[data_length - 1])

	return data[..(data_length - padding_length)]
}

// pad adds bytes to the end of the data to ensure that it aligns on a block boundary.
// If the data is already aligned, a new block of padding is added. In addition, if
// the block size is less than 0 or greater than 256 the function will panic.
pub fn pad(data []byte, block_size int) []byte {
	if block_size < 0 || block_size > 256 {
		panic('Invalid block size. Your block size should be between 0 and 256. It was $block_size')
	}

	padding_length := block_size - data.len % block_size
	padding_bytes := byte(padding_length).repeat(padding_length).bytes()

	mut output := data.clone()
	output << padding_bytes

	return output
}

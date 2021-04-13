const char *LIB842_CLDECOMPRESS_KERNEL_SOURCE =
"// NB: When we build the program, we prepend the 842 definitions,\n"
"//     i.e. we kind of do the equivalent to this include:\n"
"// #include \"../common/842.h\"\n"
"\n"
"typedef uchar uint8_t;\n"
"typedef ushort uint16_t;\n"
"typedef short int16_t;\n"
"typedef uint uint32_t;\n"
"typedef ulong uint64_t;\n"
"\n"
"// Define NULL, since it is not required by the OpenCL C 1.2 standard\n"
"// Most common vendor implementations define it anyway (Intel, NVIDIA),\n"
"// but pocl adheres strictly to the standard and doesn't\n"
"// See also: https://github.com/pocl/pocl/issues/831\n"
"#ifndef NULL\n"
"#define NULL 0L\n"
"#endif\n"
"\n"
"#if defined(USE_MAYBE_COMPRESSED_CHUNKS) || defined(USE_INPLACE_COMPRESSED_CHUNKS)\n"
"__constant static const uint8_t LIB842_COMPRESSED_CHUNK_MARKER[] =\n"
"	LIB842_COMPRESSED_CHUNK_MARKER_DEF; // Defined at build time\n"
"#endif\n"
"\n"
"#ifndef USE_INPLACE_COMPRESSED_CHUNKS\n"
"#define RESTRICT_UNLESS_INPLACE restrict\n"
"#else\n"
"#define RESTRICT_UNLESS_INPLACE\n"
"#endif\n"
"\n"
"#ifdef USE_INPLACE_COMPRESSED_CHUNKS\n"
"#define USE_LOOKAHEAD_BUFFER\n"
"#else\n"
"// TODOXXX: This isn't needed here and looks like a complete waste,\n"
"//          but on Intel hardware, enabling this actually makes a HUGE\n"
"//          positive difference on the execution time.\n"
"//          Which makes no sense since it's theoretically speaking, this\n"
"//          is not actually saving any memory reads\n"
"//          Probably it's just that enabling this just triggers a different\n"
"//          path in the compiler which actually works better for us...\n"
"#define USE_LOOKAHEAD_BUFFER\n"
"#endif\n"
"\n"
"#define ENABLE_ERROR_HANDLING\n"
"\n"
"struct sw842_param_decomp {\n"
"	__global uint64_t *out;\n"
"	__global const uint64_t *ostart;\n"
"	__global const uint64_t *in;\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	__global const uint64_t *istart;\n"
"	size_t ilen;\n"
"	size_t olen;\n"
"	int errorcode;\n"
"#endif\n"
"	uint32_t bits;\n"
"	uint64_t buffer;\n"
"#ifdef USE_LOOKAHEAD_BUFFER\n"
"	// TODOXXX: This amount of lookahead is insufficient, and can be overflowed\n"
"	// on certain 'unfortunate' cases of input data.\n"
"	// This causes this mode to be currently 'broken' for the general case\n"
"	// See the notes in the comments on cl.h for more details\n"
"	uint64_t lookAheadBuffer[6];\n"
"#endif\n"
"};\n"
"\n"
"/* number of bits in a buffered word */\n"
"#define WSIZE 64 //sizeof(uint64_t)\n"
"\n"
"/* rolling fifo sizes */\n"
"#define I2_FIFO_SIZE (2 * (1 << I2_BITS))\n"
"#define I4_FIFO_SIZE (4 * (1 << I4_BITS))\n"
"#define I8_FIFO_SIZE (8 * (1 << I8_BITS))\n"
"\n"
"#define __round_mask(x, y) ((y)-1)\n"
"#define round_down(x, y) ((x) & ~__round_mask(x, y))\n"
"\n"
"static inline uint64_t swap_be_to_native64(uint64_t value)\n"
"{\n"
"#ifdef __ENDIAN_LITTLE__\n"
"	return as_ulong(as_uchar8(value).s76543210);\n"
"#else\n"
"	return value;\n"
"#endif\n"
"}\n"
"\n"
"static inline uint64_t swap_native_to_be64(uint64_t value)\n"
"{\n"
"#ifdef __ENDIAN_LITTLE__\n"
"	return as_ulong(as_uchar8(value).s76543210);\n"
"#else\n"
"	return value;\n"
"#endif\n"
"}\n"
"\n"
"static inline uint16_t swap_be_to_native16(uint16_t value)\n"
"{\n"
"#ifdef __ENDIAN_LITTLE__\n"
"	return as_ushort(as_uchar2(value).s10);\n"
"#else\n"
"	return value;\n"
"#endif\n"
"}\n"
"\n"
"static inline uint16_t swap_native_to_be16(uint16_t value)\n"
"{\n"
"#ifdef __ENDIAN_LITTLE__\n"
"	return as_ushort(as_uchar2(value).s10);\n"
"#else\n"
"	return value;\n"
"#endif\n"
"}\n"
"\n"
"static inline uint64_t read_bits(struct sw842_param_decomp *p, uint32_t n)\n"
"{\n"
"	uint64_t value = p->buffer >> (WSIZE - n);\n"
"	if (p->bits < n) {\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	if ((p->in - p->istart + 1) * sizeof(uint64_t) > p->ilen) {\n"
"		if (p->errorcode == 0)\n"
"			p->errorcode = -EINVAL;\n"
"		return 0;\n"
"	}\n"
"#endif\n"
"#ifdef USE_LOOKAHEAD_BUFFER\n"
"		p->buffer = p->lookAheadBuffer[0];\n"
"		p->lookAheadBuffer[0] = p->lookAheadBuffer[1];\n"
"		p->lookAheadBuffer[1] = p->lookAheadBuffer[2];\n"
"		p->lookAheadBuffer[2] = p->lookAheadBuffer[3];\n"
"		p->lookAheadBuffer[3] = p->lookAheadBuffer[4];\n"
"		p->lookAheadBuffer[4] = p->lookAheadBuffer[5];\n"
"		p->lookAheadBuffer[5] = ((p->in - p->istart + 6) * sizeof(uint64_t) < p->ilen) ? swap_be_to_native64(*(p->in + 6)) : 0;\n"
"#else\n"
"		p->buffer = swap_be_to_native64(*p->in);\n"
"#endif\n"
"		p->in++;\n"
"		value |= p->buffer >> (WSIZE - (n - p->bits));\n"
"		// Avoid shift by 64 (only shifts of strictly less bits are allowed by the standard)\n"
"		p->buffer = ((p->buffer << (n - p->bits - 1)) << 1);\n"
"		p->bits += WSIZE - n;\n"
"		p->buffer *= (p->bits > 0);\n"
"	} else {\n"
"		p->bits -= n;\n"
"		p->buffer <<= n;\n"
"	}\n"
"\n"
"	return value;\n"
"}\n"
"\n"
"static inline uint64_t get_index(struct sw842_param_decomp *p, uint8_t size,\n"
"				 uint64_t index, uint64_t fsize)\n"
"{\n"
"	uint64_t offset;\n"
"	uint64_t total = (p->out - p->ostart) * sizeof(uint64_t);\n"
"\n"
"	offset = index * size;\n"
"\n"
"	/* a ring buffer of fsize is used; correct the offset */\n"
"	if (total > fsize) {\n"
"		/* this is where the current fifo is */\n"
"		uint64_t section = round_down(total, fsize);\n"
"		/* the current pos in the fifo */\n"
"		uint64_t pos = total - section;\n"
"\n"
"		/* if the offset is past/at the pos, we need to\n"
"		 * go back to the last fifo section\n"
"		 */\n"
"		if (offset >= pos)\n"
"			section -= fsize;\n"
"\n"
"		offset += section;\n"
"	}\n"
"\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	if (offset + size > total) {\n"
"		// TODOXXX: Commenting and uncommenting this printf has some\n"
"		// weird performance effects on NVIDIA hardware, even on valid cases\n"
"		// where this code path is never hit\n"
"		// If commented: lib842 OCL benchmark results perform worse,\n"
"		//               but dOpenCL performs MUCH better\n"
"		// If not commented: lib842 OCL benchmarks perform better,\n"
"		//                   but dOpenCL performs MUCH worse\n"
"		// This is probably related to the compiler's optimizer...\n"
"		//printf(\"index%x %lx points past end %lx\\n\", size,\n"
"		//       (unsigned long)offset, (unsigned long)total);\n"
"		p->errorcode = -EINVAL;\n"
"		return 0;\n"
"	}\n"
"#endif\n"
"\n"
"	return offset;\n"
"}\n"
"\n"
"static inline void do_op(struct sw842_param_decomp *p, uint8_t op)\n"
"{\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	if (op >= OPS_MAX) {\n"
"		p->errorcode = -EINVAL;\n"
"		return;\n"
"	}\n"
"#endif\n"
"\n"
"	uint64_t output_word = 0;\n"
"	uint32_t bits = 0;\n"
"\n"
"	// Calculate the number of bits for all 4 operations in the template\n"
"	// This formula exploits the regularity/pattern in the templates (see below)\n"
"	uint8_t opbits = 64 - ((op % 5) + 1) / 2 * 8 - ((op % 5) / 4) * 7\n"
"			    - ((op / 5) + 1) / 2 * 8 - ((op / 5) / 4) * 7;\n"
"	uint64_t params = read_bits(p, opbits);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	if (p->errorcode != 0)\n"
"		return;\n"
"#endif\n"
"\n"
"	for (int i = 0; i < 4; i++) {\n"
"		// For templates 0 to 24 (inclusive), they follow a regular pattern\n"
"		// each 5 templates. In particular, the operations which determine\n"
"		// how the first four bytes of the output data are decoded depend on\n"
"		// (op / 5), and analogously, those that determine the last four bytes\n"
"		// are determined by (op % 5)\n"
"		// This regularity makes it feasible to develop formulas to compute the\n"
"		// this information efficiently enough to outperform table lookups\n"
"		// Template 25 (index reference to 8 bytes) does not easily fit\n"
"		// those patterns, so it is handled separately\n"
"		uint8_t opchunk = (i < 2) ? op / 5 : op % 5;\n"
"		uint32_t is_index = (i & 1) * (opchunk & 1) + ((i & 1) ^ 1) * (opchunk >= 2);\n"
"		uint32_t dst_size = 2 + (opchunk >= 4) * (1 - 2 * (i % 2)) * 2;\n"
"		uint8_t num_bits = (i & 1) * (16 - (opchunk % 2) * 8 - (opchunk >= 4) * 16) +\n"
"				   ((i & 1) ^ 1) * (16 - (opchunk / 2) * 8 + (opchunk >= 4) * 9);\n"
"\n"
"		// https://stackoverflow.com/a/28703383\n"
"		uint64_t bitsmask = ((uint64_t)-(num_bits != 0)) &\n"
"				    (((uint64_t)-1) >> (64 - num_bits));\n"
"		uint64_t value = (params >> (opbits - num_bits)) & bitsmask;\n"
"		opbits -= num_bits;\n"
"\n"
"		if (is_index) {\n"
"			// fifo_size = 512 if dst_size = 2. = 2048 if dst_size = 4\n"
"			// (See constants I2_FIFO_SIZE, I4_FIFO_SIZE)\n"
"			uint64_t fifo_size = 2048 - 1536 * ((dst_size >> 2) < 1);\n"
"			uint64_t offset = get_index(\n"
"				p, dst_size, value, fifo_size);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if (p->errorcode != 0)\n"
"				return;\n"
"#endif\n"
"			offset >>= 1;\n"
"			__global uint16_t *ostart16 =\n"
"				(__global uint16_t *)p->ostart;\n"
"			value = (((uint64_t)swap_be_to_native16(ostart16[offset])) << 48) |\n"
"				(((uint64_t)swap_be_to_native16(ostart16[offset + 1])) << 32);\n"
"			value >>= (WSIZE - (dst_size << 3));\n"
"		}\n"
"		output_word |= value\n"
"			       << (64 - (dst_size << 3) - bits);\n"
"		bits += dst_size << 3;\n"
"	}\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	if ((p->out - p->ostart) * sizeof(uint64_t) + 8 > p->olen) {\n"
"		p->errorcode = -ENOSPC;\n"
"		return;\n"
"	}\n"
"#endif\n"
"	*p->out++ = swap_native_to_be64(output_word);\n"
"}\n"
"\n"
"static inline int decompress_core(__global const uint64_t *RESTRICT_UNLESS_INPLACE in, size_t ilen,\n"
"				  __global uint64_t *RESTRICT_UNLESS_INPLACE out, size_t *olen)\n"
"{\n"
"	struct sw842_param_decomp p;\n"
"	p.ostart = p.out = out;\n"
"	p.in = in;\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	p.istart = p.in;\n"
"	p.ilen = ilen;\n"
"	p.olen = *olen;\n"
"	p.errorcode = 0;\n"
"#endif\n"
"\n"
"	p.buffer = 0;\n"
"#ifdef USE_LOOKAHEAD_BUFFER\n"
"	p.lookAheadBuffer[0] = ((p.in - p.istart) * sizeof(uint64_t) < p.ilen) ? swap_be_to_native64(*(p.in + 0)) : 0;\n"
"	p.lookAheadBuffer[1] = ((p.in - p.istart + 1) * sizeof(uint64_t) < p.ilen) ? swap_be_to_native64(*(p.in + 1)) : 0;\n"
"	p.lookAheadBuffer[2] = ((p.in - p.istart + 2) * sizeof(uint64_t) < p.ilen) ? swap_be_to_native64(*(p.in + 2)) : 0;\n"
"	p.lookAheadBuffer[3] = ((p.in - p.istart + 3) * sizeof(uint64_t) < p.ilen) ? swap_be_to_native64(*(p.in + 3)) : 0;\n"
"	p.lookAheadBuffer[4] = ((p.in - p.istart + 4) * sizeof(uint64_t) < p.ilen) ? swap_be_to_native64(*(p.in + 4)) : 0;\n"
"	p.lookAheadBuffer[5] = ((p.in - p.istart + 5) * sizeof(uint64_t) < p.ilen) ? swap_be_to_native64(*(p.in + 5)) : 0;\n"
"#endif\n"
"	p.bits = 0;\n"
"\n"
"	*olen = 0;\n"
"\n"
"	uint64_t op;\n"
"\n"
"	do {\n"
"		op = read_bits(&p, OP_BITS);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"		if (p.errorcode != 0)\n"
"			return p.errorcode;\n"
"#endif\n"
"\n"
"		switch (op) {\n"
"		case OP_REPEAT:\n"
"			op = read_bits(&p, REPEAT_BITS);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if (p.errorcode != 0)\n"
"				return p.errorcode;\n"
"\n"
"			if (p.out == out) /* no previous bytes */\n"
"				return -EINVAL;\n"
"#endif\n"
"			// copy op + 1\n"
"			op++;\n"
"\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if ((p.out - p.ostart) * sizeof(uint64_t) + op * 8 > p.olen)\n"
"				return -ENOSPC;\n"
"#endif\n"
"\n"
"			while (op-- > 0) {\n"
"				*p.out = *(p.out - 1);\n"
"				p.out++;\n"
"			}\n"
"			break;\n"
"		case OP_ZEROS:\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if ((p.out - p.ostart) * sizeof(uint64_t) + 8 > p.olen)\n"
"				return -ENOSPC;\n"
"#endif\n"
"			*p.out = 0;\n"
"			p.out++;\n"
"			break;\n"
"		case OP_END:\n"
"			break;\n"
"		case (OPS_MAX - 1): {\n"
"			// The I8 opcode doesn't fit into the same patterns\n"
"			// as the first 25 opcodes, so it's handled separately\n"
"			uint64_t value = read_bits(&p, 8);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if (p.errorcode != 0)\n"
"				return p.errorcode;\n"
"#endif\n"
"\n"
"			uint64_t offset = get_index(\n"
"				&p, 8, value, I8_FIFO_SIZE);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if (p.errorcode != 0)\n"
"				return p.errorcode;\n"
"			if ((p.out - p.ostart) * sizeof(uint64_t) + 8 > p.olen)\n"
"				return -ENOSPC;\n"
"#endif\n"
"			*p.out++ = p.ostart[offset >> 3];\n"
"		}\n"
"		break;\n"
"		default:\n"
"			do_op(&p, op);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"			if (p.errorcode != 0)\n"
"				return p.errorcode;\n"
"#endif\n"
"		}\n"
"	} while (op != OP_END);\n"
"\n"
"	/*\n"
"	 * crc(0:31) is saved in compressed data starting with the\n"
"	 * next bit after End of stream template.\n"
"	 */\n"
"#ifndef DISABLE_CRC\n"
"	op = read_bits(&p, CRC_BITS);\n"
"#ifdef ENABLE_ERROR_HANDLING\n"
"	if (p.errorcode != 0)\n"
"		return p.errorcode;\n"
"#endif\n"
"\n"
"	/*\n"
"	 * Validate CRC saved in compressed data.\n"
"	 */\n"
"	// FIXME: Implement CRC32 for OpenCL\n"
"	//if (crc != (uint64_t)crc32_be(0, p.ostart, (p.out - p.ostart) * sizeof(uint64_t))) {\n"
"	if (false) {\n"
"		return -EINVAL;\n"
"	}\n"
"#endif\n"
"\n"
"	*olen = (p.out - p.ostart) * sizeof(uint64_t);\n"
"\n"
"	return 0;\n"
"}\n"
"\n"
"__kernel void decompress(__global const uint64_t *RESTRICT_UNLESS_INPLACE in,\n"
"			 ulong inOffset, __global const ulong *ilen,\n"
"			 __global uint64_t *RESTRICT_UNLESS_INPLACE out,\n"
"			 ulong outOffset, __global ulong *olen,\n"
"			 ulong numChunks, __global const ulong *chunkShuffleMap,\n"
"			 __global int *returnValues)\n"
"{\n"
"	size_t chunk_num = get_global_id(0);\n"
"	if (chunk_num >= numChunks)\n"
"		return;\n"
"\n"
"	if (chunkShuffleMap != NULL)\n"
"		chunk_num = chunkShuffleMap[chunk_num];\n"
"\n"
"	__global uint64_t *my_out = out + (outOffset / 8) + ((CL842_CHUNK_SIZE / 8) * chunk_num);\n"
"	__global const uint64_t *my_in = in + (inOffset / 8) + ((CL842_CHUNK_STRIDE / 8) * chunk_num);\n"
"\n"
"	size_t my_ilen = ilen != NULL ? ilen[chunk_num] : (size_t)-1;\n"
"\n"
"#if defined(USE_MAYBE_COMPRESSED_CHUNKS) || defined(USE_INPLACE_COMPRESSED_CHUNKS)\n"
"	if (my_in[0] != ((__constant const uint64_t *)LIB842_COMPRESSED_CHUNK_MARKER)[0] ||\n"
"	    my_in[1] != ((__constant const uint64_t *)LIB842_COMPRESSED_CHUNK_MARKER)[1]) {\n"
"#ifdef USE_MAYBE_COMPRESSED_CHUNKS\n"
"		// Copy uncompressed chunk from temporary input buffer to output buffer\n"
"		for (size_t i = 0; i < CL842_CHUNK_SIZE / 8; i++) {\n"
"			my_out[i] = my_in[i];\n"
"		}\n"
"#endif\n"
"		if (olen)\n"
"			olen[chunk_num] = CL842_CHUNK_SIZE;\n"
"		if (returnValues)\n"
"			returnValues[chunk_num] = 0;\n"
"		return;\n"
"	}\n"
"\n"
"	if (my_in[2] == 0) { // Means: Skip chunk - already in destination\n"
"		if (olen)\n"
"			olen[chunk_num] = CL842_CHUNK_SIZE;\n"
"		if (returnValues)\n"
"			returnValues[chunk_num] = 0;\n"
"		return;\n"
"	}\n"
"\n"
"	// Read compressed chunk size and skip to the beginning of the chunk\n"
"	// (the end of the chunk matches the end of the input chunk buffer)\n"
"	my_ilen = my_in[2]; // TODOXXX: Avoid all this marker and embeeded lengths\n"
"			    // nonesense and just pass the lengths with ilen everywhere\n"
"	my_in += (CL842_CHUNK_SIZE - my_in[2]) / 8;\n"
"#endif\n"
"	size_t my_olen = olen != NULL ? olen[chunk_num] : (size_t)-1;\n"
"\n"
"	int ret = decompress_core(my_in, my_ilen, my_out, &my_olen);\n"
"	if (olen)\n"
"		olen[chunk_num] = my_olen;\n"
"	if (returnValues)\n"
"		returnValues[chunk_num] = ret;\n"
"}\n"
""
;

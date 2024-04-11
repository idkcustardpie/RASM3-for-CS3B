	.global	String_indexOf_2

String_indexOf_2:

	mov	x1,#0		// initialize to 0
	add	x0,x0,#9	// adr 9
	add	x1,x1,#9	// index 9

	// start at index 9
search_loop_2:
	ldrb  w2, [x0]           // Load the next byte of the string into w2 and increment the address
	cmp   w2, #'g'               // Compare the current character with 'g'
	b.ne  continue_search_2        // If they don't match, continue searching
	b     end_search_2             // End the search

continue_search_2:
	cmp   w2, #0                 // Check if we've reached the end of the string (null terminator)
	add	x1,x1,#1		// increment
	add	x0,x0,#1		// increment
	b.ne  search_loop_2            // If not, continue searching
	mov	x1,#-1			// x1 to -1 value

end_search_2:
	RET	LR			// return

	.end

	.global	String_indexOf_3

String_indexOf_3:
	mov   x1, #0                // Initialize index to 0

search_loop_3:
	ldrb  w2, [x0]           // Load the next byte of the string into w2 and increment the address
	
	cmp   w2, #'e'               // Compare the current character with 'g'
	b.ne  continue_search_3        // If they don't match, continue searching
	b     find_g             // End the search

continue_search_3:
	cmp   w2, #0                 // Check if we've reached the end of the string (null terminator)
	add	x1,x1,#1		// increment
	add	x0,x0,#1		// increment
	b.ne  search_loop_3            // If not, continue searching
	mov	x1,#-1			// -1 to x1
	b	end_search_3		// jump

find_g:
	add	x1,x1,#1		// increment
	add	x0,x0,#1		// increment
	ldrb  w2, [x0]			// load byte
	cmp     w2, #'g'               // Compare the current character with 'g'
	b.ne    continue_search_3        // If they don't match, continue searching
	b	find_g_2		// jump

find_g_2:
	add	x1,x1,#1		// increment
	add	x0,x0,#1		// increment
	ldrb    w2, [x0]		// load byte
	cmp     w2, #'g'               // Compare the current character with 'g'
	b.ne    continue_search_3        // If they don't match, continue searching
	b	find_s

find_s:
	add	x1,x1,#1		// increment
	add	x0,x0,#1		// increment
	ldrb    w2, [x0]		// load byte
	cmp     w2, #'s'               // Compare the current character with 'g'
	b.ne    continue_search_3        // If they don't match, continue searching
	sub	x1,x1,#3		// subtract
	sub	x0,x0,#3		// subtract
	ldrb	w2,[x0]			// load byte
	b	end_search_3		// jump

end_search_3:
	ret				// return
	.end

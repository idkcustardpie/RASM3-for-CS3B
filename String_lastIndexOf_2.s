	.global	String_lastIndexOf_2

String_lastIndexOf_2:
	mov	x1,#0				// initialize with 0	
	add	x0,x0,#6			// set x0 to 6
	add	x1,x1,#6			// x1 to 6 as well

search_loop_2_last:
	ldrb  	w2, [x0]           // Load the next byte of the string into w2 and increment the address
	cmp   	w2, #'g'               // Compare the current character with 'g'
	b.ne  	continue_search_2_last        // If they don't match, continue searching
	b     	end_search_2_last             // End the search

continue_search_2_last:
	cmp   	w2, #0                 // Check if we've reached the end of the string (null terminator)
	sub	x1,x1,#1			// subtract index
	sub	x0,x0,#1			// subtract address
	b.ne  	search_loop_2_last            // If not, continue searching
	mov	x1,#-1			// x1 to -1 value

end_search_2_last:
	RET	LR			// return

	.end

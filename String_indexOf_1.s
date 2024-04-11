	.global	String_indexOf_1

String_indexOf_1:
	mov   	x1, #0                 // Initialize index to 0

search_loop:
	ldrb 	w2, [x0]               // Load the next byte of the string into w2 and increment the address
	cmp   	w2, #'g'               // Compare the current character with 'g'
	b.ne  	continue_search        // If they don't match, continue searching
	b     	end_search             // End the search

continue_search:
	cmp     w2, #0                 // Check if we've reached the end of the string 
	add	x1,x1,#1		// increment x1
	add	x0,x0,#1		// increment x2
	b.ne    search_loop            // If not, continue searching
	mov	x1,#-1			// move value to x1 (-1)

end_search:
	ret				// return

	.end

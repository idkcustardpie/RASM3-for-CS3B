	.global	String_indexOf_1

String_indexOf_1:
	ldr   	x0, =test13            // Load address of test13 string into x0
	bl    	putstring              // Print the test13 string
	ldr   	x0, =s2                // Load address of s2 into x0
	mov   	x1, #0                // Initialize index to 0

search_loop:
	ldrb 	w2, [x0]           // Load the next byte of the string into w2 and increment the address
	
	cmp   	w2, #'g'               // Compare the current character with 'g'
	b.ne  	continue_search        // If they don't match, continue searching
	b     	end_search             // End the search

continue_search:
	cmp     w2, #0                 // Check if we've reached the end of the string (null terminator)
	add	x1,x1,#1
	add	x0,x0,#1	
	b.ne    search_loop            // If not, continue searching
	mov	x1,#-1

end_search:
   	ldr	x0,=newPtr
	str	x1,[x0]
   	ldr	x0,=newPtr
	ldr	x0,[x0]
	ldr	x1,=szBuffer
	bl	int64asc
	ldr	x0,=szBuffer
	bl	putstring

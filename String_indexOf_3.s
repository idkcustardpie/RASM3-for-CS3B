	.global	String_indexOf_3

String_indexOf_3:
	ldr	x0,=test15				// test string address
	bl	putstring				// print
	ldr   x0, =s2                // Load address of s2 into x0
	mov   x1, #0                // Initialize index to 0

search_loop_3:
	ldrb  w2, [x0]           // Load the next byte of the string into w2 and increment the address
	
	cmp   w2, #'e'               // Compare the current character with 'g'
	b.ne  continue_search_3        // If they don't match, continue searching
	b     find_g             // End the search

continue_search_3:
	cmp   w2, #0                 // Check if we've reached the end of the string (null terminator)
	add	x1,x1,#1
	add	x0,x0,#1	
	b.ne  search_loop_3            // If not, continue searching
	mov	x1,#-1
	b	end_search_3

find_g:
	add	x1,x1,#1
	add	x0,x0,#1
	ldrb  w2, [x0]
	cmp     w2, #'g'               // Compare the current character with 'g'
	b.ne    continue_search_3        // If they don't match, continue searching
	b	find_g_2

find_g_2:
	add	x1,x1,#1
	add	x0,x0,#1
	ldrb    w2, [x0]
	cmp     w2, #'g'               // Compare the current character with 'g'
	b.ne    continue_search_3        // If they don't match, continue searching
	b	find_s

find_s:
	add	x1,x1,#1
	add	x0,x0,#1
	ldrb    w2, [x0]
	cmp     w2, #'s'               // Compare the current character with 'g'
	b.ne    continue_search_3        // If they don't match, continue searching
	sub	x1,x1,#3
	sub	x0,x0,#3
	ldrb	w2,[x0]
	b	end_search_3

end_search_3:
   	ldr	x0,=newPtr
	str	x1,[x0]
   	ldr	x0,=newPtr
	ldr	x0,[x0]
	ldr	x1,=szBuffer
	bl	int64asc
	ldr	x0,=szBuffer
	bl	putstring

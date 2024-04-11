	.global	String_lastIndexOf_3

String_lastIndexOf_3:
	ldr	x0,=test18				// test string address
	bl	putstring				// print
	ldr     x0, =s2                // Load address of s2 into x0
	mov     x1, #0                // Initialize index to 0

search_loop_3_last:
	ldrb  w2, [x0]           // Load the next byte of the string into w2 and increment the address
	
	cmp   w2, #'e'               // Compare the current character with 'g'
	b.ne  continue_search_3_last        // If they don't match, continue searching
	b     find_g_last             // End the search

continue_search_3_last:
	cmp   w2, #0                 // Check if we've reached the end of the string (null terminator)
	add	x1,x1,#1
	add	x0,x0,#1	
	b.ne  search_loop_3_last            // If not, continue searching
	mov	x1,#-1
	b	end_search_3_last

find_g_last:
	add	x1,x1,#1
	add	x0,x0,#1
	ldrb    w2, [x0]
	cmp     w2, #'g'               // Compare the current character with 'g'
	b.ne    continue_search_3_last        // If they don't match, continue searching
	b	find_g_2_last

find_g_2_last:
	add	x1,x1,#1
	add	x0,x0,#1
	ldrb    w2, [x0]
	cmp     w2, #'g'               // Compare the current character with 'g'
	b.ne    continue_search_3_last        // If they don't match, continue searching
	sub	x1,x1,#2
	sub	x0,x0,#2
	ldrb    w2, [x0]
	b	end_search_3_last

end_search_3_last:
   	ldr	x0,=newPtr
	str	x1,[x0]
   	ldr	x0,=newPtr
	ldr	x0,[x0]
	ldr	x1,=szBuffer
	bl	int64asc
	ldr	x0,=szBuffer
	bl	putstring
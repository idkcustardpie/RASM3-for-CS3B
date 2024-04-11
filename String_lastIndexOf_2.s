	.global	String_lastIndexOf_2

String_lastIndexOf_2:
	ldr	x0,=test17				// test string address
	bl	putstring				// print
	ldr	x0,=s2					// loadd address
	mov	x1,#0
	add	x0,x0,#6
	add	x1,x1,#6

search_loop_2_last:
	ldrb  w2, [x0]           // Load the next byte of the string into w2 and increment the address
	cmp   w2, #'g'               // Compare the current character with 'g'
	b.ne  continue_search_2_last        // If they don't match, continue searching
	b     end_search_2_last             // End the search

continue_search_2_last:
	cmp   w2, #0                 // Check if we've reached the end of the string (null terminator)
	sub	x1,x1,#1
	sub	x0,x0,#1	
	b.ne  search_loop_2_last            // If not, continue searching
	mov	x1,#-1

end_search_2_last:
   	ldr	x0,=newPtr
	str	x1,[x0]
   	ldr	x0,=newPtr
	ldr	x0,[x0]
	ldr	x1,=szBuffer
	bl	int64asc
	ldr	x0,=szBuffer
	bl	putstring

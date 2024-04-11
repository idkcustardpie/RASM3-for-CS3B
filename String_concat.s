	.global

str_concat:						// "\n22. String_concat(s1, '' ''); String_concat(s1, s2) =  "

	ldr	x0,=test22				// test string address
	bl	putstring				// print

	ldr     x0, =s1					// load s1 address to x0
	bl      String_length				// obtain length
	bl      malloc					// allocate memory for string
	ldr     x1, =newPtr				// load address of ptr to x1
	str     x0, [x1]				// store value stored in x1 to x0

	ldr     x0, =s1					// load s1 address to x0
	ldr     x1, [x1]    				// load value in address to x1
	bl      copy_string				// copy string function

	ldr     x0, =newPtr				// load newPtr address to x0
	ldr     x0, [x0]				// load value stored in adr to x0
	bl      putstring				// print

	ldr     x0, =newPtr				// load address to x0
	ldr     x0, [x0]				// load value stored in adr to x0
	bl      free					// free memory

	ldr     x0, =szSpace				// load s1 address to x0
	bl      String_length				// obtain length
	bl      malloc					// allocate memory for string
	ldr     x1, =newPtr				// load address of ptr to x1
	str     x0, [x1]				// store value stored in x1 to x0

	ldr     x0, =szSpace				// load s1 address to x0
	ldr     x1, [x1]    				// load value in address to x1
	bl      copy_string				// copy string function

	ldr     x0, =newPtr				// load newPtr address to x0
	ldr     x0, [x0]				// load value stored in adr to x0
	bl      putstring				// print

	ldr     x0, =newPtr				// load address to x0
	ldr     x0, [x0]				// load value stored in adr to x0
	bl      free					// free memory

	ldr     x0, =s2					// load s1 address to x0
	bl      String_length				// obtain length
	bl      malloc					// allocate memory for string
	ldr     x1, =newPtr				// load address of ptr to x1
	str     x0, [x1]				// store value stored in x1 to x0

	ldr     x0, =s2					// load s1 address to x0
	ldr     x1, [x1]    				// load value in address to x1
	bl      copy_string				// copy string function

	ldr     x0, =newPtr				// load newPtr address to x0
	ldr     x0, [x0]				// load value stored in adr to x0
	bl      putstring				// print

	ldr     x0, =newPtr				// load address to x0
	ldr     x0, [x0]				// load value stored in adr to x0
	bl      free					// free memory

	
	b	exit_seq				// last test case, jump directly to end	--------- BRANCH BRANCH EXIT


copy_string:	
    ldrb   w2, [x0], #1    	  // Load byte from source and increment source pointer
    strb   w2, [x1], #1    	  // Store byte to destination and increment destination pointer
    cbz    w2, end_copy_string    // Check for null terminator
    b      copy_string     	  // continue to copy if not

end_copy_string:
    ret				// return to the place it was called!

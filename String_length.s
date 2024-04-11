	.global	String_length

String_length:
	ldr	x0,=s1Text				// load address to x0
	bl	putstring				// print string

	ldr	x0,=s1     				// load string address in x0
	bl    	String_length    			// obtain length

	ldr	x1, =db1    				// load address to x0
	str	x0,[x1]          			// store value in x1 to x0

	ldr	x1, =sz1         			// load address to x1
	bl	int64asc    				// convert to ascii, put in szLength

	ldr	x0,=sz1     				// load address to x0
	bl	putstring        			// print the string length value

	ldr	x0,=s2Text				// load address to x0
	bl	putstring				// print string

	ldr	x0,=s2    				// load string address in x0
	bl    	String_length    			// obtain length

	ldr	x2,=db2    				// load address to x0
	str	x0,[x2]          			// store value in x1 to x0

	ldr	x1, =sz2        			// load address to x1
	bl	int64asc    				// convert to ascii, put in szLength

	ldr	x0,=sz2     				// load address to x0
	bl	putstring        			// print the string length value

	ldr	x0,=s3Text				// load address to x0
	bl	putstring				// print string

	ldr	x0,=s3     				// load string address in x0
	bl    	String_length    			// obtain length

	ldr	x3, =db3    				// load address to x0
	str	x0,[x3]          			// store value in x1 to x0

	ldr	x1, =sz3         			// load address to x1
	bl	int64asc    				// convert to ascii, put in szLength

	ldr	x0,=sz3     				// load address to x0
	bl	putstring        			// print the string length value


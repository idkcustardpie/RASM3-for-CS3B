   .global _start

   .equ	BUFFER, 21

   .data
szS1:		.asciz "Cat in the hat."	// Variable containing the first test string
szS2:		.asciz "Green eggs and ham."	// Variable containing the second test string
szS3:		.asciz "cat in the hat."	// Variable containing the third test string

szS1Length:	.asciz "s1.length() = "		// String displayed when testing String_length with s1
szS2Length:	.asciz "s2.length() = "		// String displayed when testing String_length with s2
szS3Length:	.asciz "s3.length() = "		// String displayed when testing String_length with s3

szEquals1_3:	.asciz "String_equals(s1,s3) = "	// String displayed when testing String_equals with s1 and s3
szEquals1_1:	.asciz "String_equals(s1,s1) = "	// String displayed when testing String_equals with s1 and s1

szIgnore1_3:	.asciz "String_equalsIgnoreCase(s1,s3) = "	// String displayed when testing String_equalsIgnoreCase with s1 and s3
szIgnore1_2:	.asciz "String_equalsIgnoreCase(s1,s2) = "	// String displayed when testing String_equalsIgnoreCase with s1 and s2

szCopy:		.asciz "s4 = String_copy(s1)\ns1 = "	// String displayed when testing String_copy with s1
szS4Copy:	.asciz "s4 = "				// String displayed when s4 is displayed

szSubstring_1:	.asciz "String_substring_1(s3,4,14) = "	// String displayed when testing String_substring_1 with s3, getting the substring from 4 to 14
szSubstring_2:	.asciz "String_substring_2(s3,7) = "	// String displayed when testing String_substring_2 with s3, getting the substring from 7 to the end

szCharAt:	.asciz "String_charAt(s2,4) = "		// String displayed when testing String_charAt with s2, getting the char at 4

szStartsWith_1:	.asciz "String_startsWith_1(s1,11,\"hat.\") = "		// String displayed when testing String_startsWith_1 with s1, checking element 11 for the prefix "hat"
szStartsWith_2:	.asciz "String_startsWith_2(s1,\"Cat\") = "		// String displayed when testing String_startsWith_2 with s1, checking for the prefix "Cat"
szEndsWith:	.asciz "String_endsWith(s1,\"in the hat.\") = "		// String displayed when testing String_endsWith with s1, checking for the suffix "in the hat."

szPrefix_1:	.asciz "hat."		// String variable containing the prefix "hat"
szPrefix_2:	.asciz "Cat"		// String variable containing the prefix "Cat"
szSuffix:	.asciz "in the hat."	// String variable containing the suffix "in the hat."

szTrue:		.asciz "TRUE"	// String variable used whenever a function returns as TRUE
szFalse:	.asciz "FALSE"	// String variable used whenever a function returns as FALSE

chChar:		.byte 0x00	// char variable containing the hex value of the character returned from String_charAt

dbLength:	.quad 0		// double variable containing the length of a string

ptrS4:		.quad 0		// pointer variable for the dynamically allocated s4
ptrSubstring_1:	.quad 0		// pointer variable for the dynamically allocated substring_1
ptrSubstring_2:	.quad 0		// pointer variable for the dynamically allocated substring_2

szBuffer:	.skip BUFFER	// String variable used to display double variables

chLF:		.byte 0x0a	// char variable containing the hex value of the new line character

   .text
_start:
   // Testing String_length
   ldr	x0,=szS1Length	// load the address of szS1Length to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load the address of szS1 to x0
   bl	String_length	// branch and link to String_length

   ldr	x1,=szBuffer	// load the address of szBuffer to x1
   bl	int64asc	// branch and link to int64asc

   ldr	x0,=szBuffer	// load the address of szBuffer to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   ldr	x0,=szS2Length	// load the address of szS2Length to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS2	// load the address of szS2 to x0
   bl	String_length	// branch and link to String_length

   ldr	x1,=szBuffer	// load the address of szBuffer to x1
   bl	int64asc	// branch and link to int64asc

   ldr	x0,=szBuffer	// load the address of szBuffer to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   ldr	x0,=szS3Length	// load the address of szS3Length to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS3	// load the address of szS3 to x0
   bl	String_length	// branch and link to String_length

   ldr	x1,=szBuffer	// load the address of szBuffer to x1
   bl	int64asc	// branch and link to int64asc

   ldr	x0,=szBuffer	// load the address of szBuffer to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_equals
   ldr	x0,=szEquals1_3	// load the address of szEquals1_3 to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load address of szS1 to x0
   ldr	x1,=szS3	// load address of szS3 to x1

   bl	String_equals	// branch and link to String_equals

   cmp	x0, #1		// comapre x0 to 1
   beq	s3_true		// branch to s3_true if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	s1_equals	// branch to s1_equals

s3_true:
   ldr	x0,=szTrue	// load address of szTrue to x0
   bl	putstring	// branch and link to putstring

s1_equals:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   ldr	x0,=szEquals1_1	// load the address of szEquals1_1 to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load address of szS1 to x0
   ldr	x1,=szS1	// load address of szS1 to x1

   bl	String_equals	// branch and link to String_equals

   cmp	x0, #1		// comapre x0 to 1
   beq	s1_true		// branch to s1_true if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	s1_equals_cap	// branch to s1_equals_cap

s1_true:
   ldr	x0,=szTrue	// load address of szTrue to x0
   bl	putstring	// branch and link to putstring

s1_equals_cap:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_equalsIgnoreCase
   ldr	x0,=szIgnore1_3		// load the address of szIgnore1_3 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=szS1	// load the address of szS1 to x0
   ldr	x1,=szS3	// load the address of szS3 to x1

   bl	String_equalsIgnoreCase	// branch and link to String_equalsIgnoreCase

   cmp	x0, #1		// compare x0 to 1
   beq	s3_ignore_true	// branch to s3_ignore_true if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	s2_equals	// branch to s2_equals

s3_ignore_true:
   ldr	x0,=szTrue	// load the address of szTrue to x0
   bl	putstring	// branch and link to putstring

s2_equals:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   ldr	x0,=szIgnore1_2	// load the address of szIgnore1_2 to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load the address of szS1 to x0
   ldr	x1,=szS2	// load the address of szS2 to x1

   bl	String_equalsIgnoreCase	// Branch and link to String_equalsIgnoreCase

   cmp	x0, #1		// compare x0 to 1
   beq	s2_ignore_true	// branch to s2_ignore_true if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	copy		// branch to copy

s2_ignore_true:
   ldr	x0,=szTrue	// load the address of szTrue to x0
   bl	putstring	// branch and link to putstring

copy:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_copy
   ldr	x0,=szCopy	// load the address of szCopy to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load the address of szS1 to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   ldr	x0,=szS4Copy	// load the address of szS4Copy to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load address of szS1 to x0
   bl	String_copy	// branch and link to String_copy

   ldr	x1,=ptrS4	// load address of ptrS4 to x1
   str	x0,[x1]		// store x0 to the address that x1 points to
   ldr	x0,=ptrS4	// load address of ptrS4 to x0
   ldr	x0,[x0]		// load the value stored at x0 to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=ptrS4	// load the address of ptrS4
   ldr	x0,[x0]		// load the value stored at x0 to x0
   bl	free		// branch and link to free

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_substring_1
   ldr	x0,=szSubstring_1	// load address of szSubstring_1 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=szS3	// load address of szS3
   mov	x1,#4		// copy 4 into x1
   mov	x2,#14		// copy 14 into x1

   bl	String_substring_1	// branch and link to String_substring_1

   ldr	x1,=ptrSubstring_1	// load address of ptrSubstring_1 to x1
   str	x0,[x1]			// store x0 into the address pointed to by x1
   ldr	x0,=ptrSubstring_1	// load address of ptrSubstring_1 to x0
   ldr	x0,[x0]			// load the value stored at x0 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=ptrSubstring_1	// load address of ptrSubstring_1 to x0
   ldr	x0,[x0]			// load the value stored at x0 to x0
   bl	free			// branch and link to free

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_substring_2
   ldr	x0,=szSubstring_2	// load address of szSubstring_2 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=szS3	// load address of szS3 to x0
   mov	x1,#7		// copy 7 into x1

   bl	String_substring_2	// branch and link to String_substring_2

   ldr	x1,=ptrSubstring_2	// load address of ptrSubstring_2 to x1
   str	x0,[x1]			// store x0 into the address pointed to by x1
   ldr	x0,=ptrSubstring_2	// load address of ptrSubstring_2 to x0
   ldr	x0,[x0]			// load the value stored at x0 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=ptrSubstring_2	// load address of ptrSubstring_2 to x0
   ldr	x0,[x0]			// load the value stored at x0 to x0
   bl	free			// branch and link to free

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_charAt
   ldr	x0,=szCharAt	// load address of szCharAt to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS2	// load address of szS2 to x0
   mov	x1,#4		// copy 4 into x1

   bl	String_charAt	// branch and link to String_charAt

   ldr	x1,=chChar	// load address of chChar to x1
   strb	w0,[x1]		// store a byte of w0 to x1

   ldr	x0,=chChar	// load address of chChar to x0
   bl	putch		// branch and link to putch

   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_startsWith_1
   ldr	x0,=szStartsWith_1	// load address of szStartsWith_1 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=szS1	// load address of szS1 to x0
   mov	x1, #11		// copy 11 to x1
   ldr	x2,=szPrefix_1	// load address of szPrefix_1 to x0

   bl	String_startsWith_1	// branch and link to String_startsWith_1

   cmp	x0, #1		// compare x0 to 1
   beq	start_true_1	// branch to start_true_1 if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	starts_with_2	// branch to starts_with_2

start_true_1:
   ldr	x0,=szTrue	// load address of szTrue to x0
   bl	putstring	// branch and link to putstring

starts_with_2:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // testing String_startsWith_2
   ldr	x0,=szStartsWith_2	// load address of szStartsWith_1 to x0
   bl	putstring		// branch and link to putstring

   ldr	x0,=szS1	// load address of szS1 to x0
   ldr	x1,=szPrefix_2	// load address of szPrefix_2 to x1

   bl	String_startsWith_2	// branch and link to String_startsWith_2

   cmp	x0, #1		// compare x0 to 1
   beq	start_true_2	// branch to start_true_2 if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	ends_with	// branch to ends_with

start_true_2:
   ldr	x0,=szTrue	// load address of szTrue to x0
   bl	putstring	// branch and link to putstring

ends_with:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   // Testing String_endsWith
   ldr	x0,=szEndsWith	// load address of szEndsWith to x0
   bl	putstring	// branch and link to putstring

   ldr	x0,=szS1	// load address of szS1 to x0
   ldr	x1,=szSuffix	// load address of szSuffix to x1

   bl	String_endsWith	// Branch and link to String_endsWith

   cmp	x0, #1		// compare x0 to 1
   beq	end_true	// branch to end_true if x0 is equal to 1

   ldr	x0,=szFalse	// load address of szFalse to x0
   bl	putstring	// branch and link to putstring
   b	next		// branch to next

end_true:
   ldr	x0,=szTrue	// load address of szTrue to x0
   bl	putstring	// branch and link to putstring

next:
   ldr	x0,=chLF	// load the address of chLF to x0
   bl	putch		// branch and link to putch

   /**** Exit Sequence ****/
   mov	x0,#0		// Use 0 return code
   mov	x8,#93		// Service code 93 terminates the program
   svc	0		// call Linux to terminate

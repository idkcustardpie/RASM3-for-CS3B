// *************************** driver.s file *********************************** //
// Notes: Separate files were combined to make a singular driver file
// ***************************************************************************** //
	.global  _start

       		.equ      BUFFER, 21		// buffer
	.data

s1:		.asciz	  "Cat in the hat."	// strings
s2:		.asciz	  "Green eggs and ham."
s3:		.asciz	  "cat in the hat"
s4:		.asciz	  " "

szPrompt1:	.asciz 	  "Enter s1: "			// prompt 1
szPrompt2:	.asciz    "Enter s2: "			// prompt 2
szPrompt3:	.asciz    "Enter s3: "			// prompt 3
newPtr:		.quad	  0				// quad variable holding values for index
sz1:  		.skip     BUFFER               		// allocate memory: hold length
sz2:  		.skip     BUFFER                	// allocate memory
sz3:  		.skip     BUFFER                	// allocate memory
szBuffer:	.skip	  BUFFER			// allocate memory
s1Text:		.asciz	  "\n01. s1.length() = "	// string length equal to 
s2Text:		.asciz	  "\n    s2.length() = "	// string length equal to 
s3Text:		.asciz	  "\n    s3.length() = "	// string length equal to 
szSpace:	.asciz	  " "
db1:    	.asciz    "0"				// value of the str length 
db2:    	.asciz    "0"				// value of the str length 
db3:    	.asciz    "0"				// value of the str length 
chLF:		.byte	  0x0a				// ch new line

strName:	.asciz	  "Collaborators: Jazmine Encarnacion, Adam Lenzini, and Yusuf Taheri\n"
strProgram:	.asciz	  "Project: RASM3\n"
strClass:	.asciz	  "Class: CS3B with Barnett\n"
strDate:	.asciz	  "Date: 4/11/2024\n\n"

test2:		.asciz	  "\n02. String_equals(s1,s3) = "					// FALSE
test3:		.asciz	  "03. String_equals(s1,s1) = "						// TRUE
test4:		.asciz    "04. String_equalsIgnoreCase(s1,s3) = "				// TRUE
test5:		.asciz	  "05. String_equalsIgnoreCase(s1,s2) = "				// FALSE
test6:		.asciz    "06. String_copy(s1 -> s4) = "					// s4 = s1
test7:		.asciz    "07. String_substring_1(s3,4,14) = "					// "in the hat"
test8:		.asciz    "08. String_substring_2(s3,7) = "					// "the hat."
test9:		.asciz	  "09. String_charAt(s2,4) = "						// 'n'
test10:		.asciz    "10. String_startsWith_1(s1,11,\"hat.\") = "				// TRUE
test11:		.asciz	  "11. String_startsWith_2(s1,\"Cat\") = "				// TRUE
test12:		.asciz	  "12. String_endsWith(s1,\"in the hat.\") = "				// TRUE
test13:		.asciz	  "\n13. String_indexOf_1(s2,'g') = "					// 7
test14:		.asciz	  "\n14. String_indexOf_2(s2,'g',9) = "					// -1
test15:		.asciz	  "\n15. String_indexOf_3(s2,\"eggs\") = "				// 6
test16:		.asciz	  "\n16. String_lastIndexOf_1(s2,'g') = "				// 8
test17:		.asciz	  "\n17. String_lastIndexOf_2(s2,'g',6) = "				// -1
test18:		.asciz	  "\n18. String_lastIndexOf_3(s2,\"egg\") = "				// 6
test19:		.asciz	  "\n19. String_replace(s1,'a','o') = "					// Cot in the hot
test20:		.asciz	  "\n20. String_toLowerCase(s1) = "					// cot in the hot
test21:		.asciz	  "\n21. String_toUpperCase(s1) = " 					// COT IN THE HOT
test22:		.asciz	  "\n22. String_concat(s1,\" \"); String_concat(s1, s2) = "		// COT IN THE HOT. Green eggs and ham.

szS1Copy:	.asciz	  "\ts1 = "			// test6 string
szS4Copy:	.asciz	  "\ts4 = "			// test6 string
szPrefix_1:	.asciz 	  "hat."			// String variable containing the prefix "hat"
szPrefix_2:	.asciz    "Cat"				// String variable containing the prefix "Cat"
szSuffix:	.asciz    "in the hat."			// String variable containing the suffix "in the hat."
szTrue:		.asciz    "TRUE"			// String variable used whenever a function returns as TRUE
szFalse:	.asciz    "FALSE"			// String variable used whenever a function returns as FALSE
chChar:		.byte     0x00	        		// char variable containing the hex value of the character returned from String_charAt
dbLength:	.quad     0				// double variable containing the length of a string
ptrS4:		.quad     0				// pointer variable for the dynamically allocated s4
ptrSubstring_1:	.quad     0				// pointer variable for the dynamically allocated substring_1
ptrSubstring_2:	.quad     0				// pointer variable for the dynamically allocated substring_2

// ***************************************************************************** //

    	.text

_start:
	b	print_info				// jump to print information (name,date,class,project)

user_input:
	ldr	x0,=szPrompt1				// load address of szPrompt to x0
	bl	putstring				// print the string 
	ldr	x0,=s1					// load s1 address to x0
	mov	x1,BUFFER				// determine size buffer
	bl	getstring				// obtain the user input

	ldr	x0,=szPrompt2				// load address to x0
	bl	putstring				// print
	ldr	x0,=s2					// load s2 address
	mov	x1,BUFFER				// determine size buffer
	bl	getstring				// obtain the user input

	ldr	x0,=szPrompt3				// load address to x0
	bl	putstring				// print
	ldr	x0,=s3					// load s3 address
	mov	x1,BUFFER				// determine size buffer
	bl	getstring				// obtain the user input

test1:
	// Test 1 string length values
	ldr	x0,=s1Text
	bl	putstring
	ldr	x0,=s1
	bl	String_length
	ldr	x1,=sz1
	bl	int64asc
	ldr	x0,=sz1
	bl	putstring

	ldr	x0,=s2Text
	bl	putstring
	ldr	x0,=s2
	bl	String_length
	ldr	x1,=sz2
	bl	int64asc
	ldr	x0,=sz2
	bl	putstring

	ldr	x0,=s3Text
	bl	putstring
	ldr	x0,=s3
	bl	String_length
	ldr	x1,=sz3
	bl	int64asc
	ldr	x0,=sz3
	bl	putstring

// ************************** MEMBER #1 ************************************* //

  // Testing String_equals
   ldr	x0,=test2			// load the address of test2 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load address of s1 to x0
   ldr	x1,=s3				// load address of s3 to x1

   bl	String_equals			// branch and link to String_equals

   cmp	x0, #1				// comapre x0 to 1
   beq	s3_true				// branch to s3_true if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	s1_equals			// branch to s1_equals

s3_true:
   ldr	x0,=szTrue			// load address of szTrue to x0
   bl	putstring			// branch and link to putstring

s1_equals:
   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   ldr	x0,=test3			// load the address of test3 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load address of s1 to x0
   ldr	x1,=s1				// load address of s1 to x1

   bl	String_equals			// branch and link to String_equals

   cmp	x0, #1				// comapre x0 to 1
   beq	s1_true				// branch to s1_true if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	s1_equals_cap			// branch to s1_equals_cap

s1_true:
   ldr	x0,=szTrue			// load address of szTrue to x0
   bl	putstring			// branch and link to putstring

s1_equals_cap:
   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_equalsIgnoreCase
   ldr	x0,=test4			// load the address of test4 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load the address of s1 to x0
   ldr	x1,=s3				// load the address of s3 to x1

   bl	String_equalsIgnoreCase		// branch and link to String_equalsIgnoreCase

   cmp	x0, #1				// compare x0 to 1
   beq	s3_ignore_true			// branch to s3_ignore_true if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	s2_equals			// branch to s2_equals

s3_ignore_true:
   ldr	x0,=szTrue			// load the address of szTrue to x0
   bl	putstring			// branch and link to putstring

s2_equals:
   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   ldr	x0,=test5			// load the address of test5 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load the address of s1 to x0
   ldr	x1,=s2				// load the address of s2 to x1

   bl	String_equalsIgnoreCase		// Branch and link to String_equalsIgnoreCase

   cmp	x0, #1				// compare x0 to 1
   beq	s2_ignore_true			// branch to s2_ignore_true if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	copy				// branch to copy

s2_ignore_true:
   ldr	x0,=szTrue			// load the address of szTrue to x0
   bl	putstring			// branch and link to putstring

copy:
   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_copy
   ldr	x0,=test6			// load the address of test6 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   ldr	x0,=szS1Copy			// load address
   bl   putstring			// print the string

   ldr	x0,=s1				// load the address of s1 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   ldr	x0,=szS4Copy			// load the address of szS4Copy to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load address of s1 to x0
   bl	String_copy			// branch and link to String_copy

   ldr	x1,=ptrS4			// load address of ptrS4 to x1
   str	x0,[x1]				// store x0 to the address that x1 points to
   ldr	x0,=ptrS4			// load address of ptrS4 to x0
   ldr	x0,[x0]				// load the value stored at x0 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=ptrS4			// load the address of ptrS4
   ldr	x0,[x0]				// load the value stored at x0 to x0
   bl	free				// branch and link to free

   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_substring_1
   ldr	x0,=test7			// load address of test7 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s3				// load address of s3
   mov	x1,#4				// copy 4 into x1
   mov	x2,#14				// copy 14 into x1

   bl	String_substring_1		// branch and link to String_substring_1

   ldr	x1,=ptrSubstring_1		// load address of ptrSubstring_1 to x1
   str	x0,[x1]				// store x0 into the address pointed to by x1
   ldr	x0,=ptrSubstring_1		// load address of ptrSubstring_1 to x0
   ldr	x0,[x0]				// load the value stored at x0 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=ptrSubstring_1		// load address of ptrSubstring_1 to x0
   ldr	x0,[x0]				// load the value stored at x0 to x0
   bl	free				// branch and link to free

   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_substring_2
   ldr	x0,=test8			// load address of test8 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s3				// load address of s3 to x0
   mov	x1,#7				// copy 7 into x1

   bl	String_substring_2		// branch and link to String_substring_2

   ldr	x1,=ptrSubstring_2		// load address of ptrSubstring_2 to x1
   str	x0,[x1]				// store x0 into the address pointed to by x1
   ldr	x0,=ptrSubstring_2		// load address of ptrSubstring_2 to x0
   ldr	x0,[x0]				// load the value stored at x0 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=ptrSubstring_2		// load address of ptrSubstring_2 to x0
   ldr	x0,[x0]				// load the value stored at x0 to x0
   bl	free				// branch and link to free

   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_charAt
   ldr	x0,=test9			// load address of test9 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s2				// load address of s2 to x0
   mov	x1,#4				// copy 4 into x1

   bl	String_charAt			// branch and link to String_charAt

   ldr	x1,=chChar			// load address of chChar to x1
   strb	w0,[x1]				// store a byte of w0 to x1

   ldr	x0,=chChar			// load address of chChar to x0
   bl	putch				// branch and link to putch

   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_startsWith_1
   ldr	x0,=test10			// load address of test10 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load address of s1 to x0
   mov	x1, #11				// copy 11 to x1
   ldr	x2,=szPrefix_1			// load address of szPrefix_1 to x0

   bl	String_startsWith_1		// branch and link to String_startsWith_1

   cmp	x0, #1				// compare x0 to 1
   beq	start_true_1			// branch to start_true_1 if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	starts_with_2			// branch to starts_with_2

start_true_1:
   ldr	x0,=szTrue			// load address of szTrue to x0
   bl	putstring			// branch and link to putstring

starts_with_2:
   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // testing String_startsWith_2
   ldr	x0,=test11			// load address of test10 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load address of s1 to x0
   ldr	x1,=szPrefix_2			// load address of szPrefix_2 to x1

   bl	String_startsWith_2		// branch and link to String_startsWith_2

   cmp	x0, #1				// compare x0 to 1
   beq	start_true_2			// branch to start_true_2 if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	ends_with			// branch to ends_with

start_true_2:
   ldr	x0,=szTrue			// load address of szTrue to x0
   bl	putstring			// branch and link to putstring

ends_with:
   ldr	x0,=chLF			// load the address of chLF to x0
   bl	putch				// branch and link to putch

   // Testing String_endsWith
   ldr	x0,=test12			// load address of test12 to x0
   bl	putstring			// branch and link to putstring

   ldr	x0,=s1				// load address of s1 to x0
   ldr	x1,=szSuffix			// load address of szSuffix to x1

   bl	String_endsWith			// Branch and link to String_endsWith

   cmp	x0, #1				// compare x0 to 1
   beq	end_true			// branch to end_true if x0 is equal to 1

   ldr	x0,=szFalse			// load address of szFalse to x0
   bl	putstring			// branch and link to putstring
   b	next				// branch to next

end_true:
   ldr	x0,=szTrue			// load address of szTrue to x0
   bl	putstring			// branch and link to putstring

next:

// ************************** MEMBER #2 ************************************ //

	// testcase 13	
	ldr   	x0, =test13            	// Load address of test13 string into x0
	bl    	putstring              	// Print the test13 string
	ldr	x0,=s2			// load address
	bl	String_indexOf_1	// branch to string index

   	ldr	x0,=newPtr		// load newPtr
	str	x1,[x0]			// store value from x1 to newPtr
   	ldr	x0,=newPtr		// load address to x0
	ldr	x0,[x0]			// load value to x0
	ldr	x1,=szBuffer		// szBuffer address to x1
	bl	int64asc		// convert
	ldr	x0,=szBuffer		// x0 address
	bl	putstring		// print the index


	// testcase 14
	ldr	x0,=test14		// test 14 string
	bl	putstring		// print
	ldr	x0,=s2			// load address
	bl	String_indexOf_2	// branch to string index

   	ldr	x0,=newPtr		// load newPtr
	str	x1,[x0]			// store value from x1 to newPtr
   	ldr	x0,=newPtr		// load address to x0
	ldr	x0,[x0]			// load value to x0
	ldr	x1,=szBuffer		// szBuffer address to x1
	bl	int64asc		// convert
	ldr	x0,=szBuffer		// x0 address
	bl	putstring		// print the index

	// testcase 15
	ldr	x0,=test15		// test string address
	bl	putstring		// print
	ldr	x0,=s2			// load address
	bl	String_indexOf_3	// branch to string index

   	ldr	x0,=newPtr		// load newPtr
	str	x1,[x0]			// store value from x1 to newPtr
   	ldr	x0,=newPtr		// load address to x0
	ldr	x0,[x0]			// load value to x0
	ldr	x1,=szBuffer		// szBuffer address to x1
	bl	int64asc		// convert
	ldr	x0,=szBuffer		// x0 address
	bl	putstring		// print the index

	// test case 16
	ldr	x0,=test16		// test string address
	bl	putstring		// print
	ldr	x0,=s2			// load address
	ldr	x1,='g'			// load character g in to register x1
	bl	String_lastIndexOf_1	// branch to string index

	mov	x1,x0			// move the index of the found character to x1
	ldr	x0,=newPtr		// load address of newPtr to x0 register
	str	x1,[x0]			// store the index value in newPtr location

   	ldr	x0,=newPtr		// load newPtr
	str	x1,[x0]			// store value from x1 to newPtr
   	ldr	x0,=newPtr		// load address to x0
	ldr	x0,[x0]			// load value to x0
	ldr	x1,=szBuffer		// szBuffer address to x1
	bl	int64asc		// convert
	ldr	x0,=szBuffer		// x0 address
	bl	putstring		// print the index

	// testcase 17
	ldr	x0,=test17		// test string address
	bl	putstring		// print
	ldr	x0,=s2			// load address
	bl	String_lastIndexOf_2	// branch to string index

   	ldr	x0,=newPtr		// load newPtr
	str	x1,[x0]			// store value from x1 to newPtr
   	ldr	x0,=newPtr		// load address to x0
	ldr	x0,[x0]			// load value to x0
	ldr	x1,=szBuffer		// szBuffer address to x1
	bl	int64asc		// convert
	ldr	x0,=szBuffer		// x0 address
	bl	putstring		// print the index

	// testcase 18
	ldr	x0,=test18		// test string address
	bl	putstring		// print
	ldr	x0,=s2			// load address
	bl	String_lastIndexOf_3	// branch to string index

   	ldr	x0,=newPtr		// load newPtr
	str	x1,[x0]			// store value from x1 to newPtr
   	ldr	x0,=newPtr		// load address to x0
	ldr	x0,[x0]			// load value to x0
	ldr	x1,=szBuffer		// szBuffer address to x1
	bl	int64asc		// convert
	ldr	x0,=szBuffer		// x0 address
	bl	putstring		// print the index

	// testcase 19
    	ldr   	x0, =test19             // Load address of test string into x0
    	bl    	putstring               // Print the test string

	ldr	x0,=s1			// load address
	bl	String_replace		// branch to replace

	ldr	x0, =s1                 // Load address of s1 into x0
	bl	putstring               // Print the modified string

	// testcase 20
	ldr	x0, =test20             // Load address of test string into x0
	bl	putstring               // Print the test string

	ldr	x0,=s1			// load address
	bl	String_toLowerCase	// branch to lowercase

	ldr	x0, =s1                 // Load address of s1 into x0
	bl	putstring               // Print the modified string

	// testcase 21
        ldr   x0, =test21               // Load address of test string into x0
        bl    putstring                 // Print the test string

	ldr	x0,=s1			// load address of s1 to x0
	bl	String_toUpperCase	// branch to uppercase

	ldr	x0, =s1                 // Load address of s1 into x0
	bl	putstring               // Print the modified string

	// testcase 22
	ldr	x0,=test22		// test string address
	bl	putstring		// print the string

	ldr	x0,=s1			// load address of s1 in to x0
	ldr	x1,=szSpace		// load szspace address to x1 register
	bl	String_concat		// branch to concatenate	

	ldr	x1,=s2			// load addres of s2 in to x1
	bl	String_concat		// branch to concatenate again

	bl	putstring		// print the new string

	// exit sequence
	b	exit_seq		// branch to the exit sequence

	/***** name, class, date ****/
print_info:
	ldr	x0,=strName		// name address to x0 register
	bl	putstring		// print
	ldr	x0,=strProgram		// program address 
	bl	putstring		// print
	ldr	x0,=strClass		// class address
	bl	putstring		// print
	ldr	x0,=strDate		// date address
	bl	putstring		// print

	b	user_input		// jump to user input

	/***** exit ****/
exit_seq:
	ldr	x0,=chLF		// load address of chLF to x0
	bl	putch			// new line
	
	mov	x0, #0       		// move value 0 to x0
	mov	x8, #93       		// syscall for exit
	svc	0            		// end program

	.end				// finally, peace

// ***************************************************************************** //


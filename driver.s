	.global  _start

       		.equ      BUFFER, 50		// buffer
	.data

s1:		.asciz	  "Cat in the hat."
s2:		.asciz	  "Green eggs and ham."
s3:		.asciz	  "cat in the hat"
s4:		.asciz	  " "

szPrompt1:	.asciz 	  "Enter s1: "
szPrompt2:	.asciz    "Enter s2: "
szPrompt3:	.asciz    "Enter s3: "

newPtr:		.quad	  0
sz1:  		.skip     BUFFER                // allocate memory
sz2:  		.skip     BUFFER                // allocate memory
sz3:  		.skip     BUFFER                // allocate memory
szBuffer:	.skip	  BUFFER

s1Text:		.asciz	  "\n01. s1.length() = "
s2Text:		.asciz	  "\n    s2.length() = "
s3Text:		.asciz	  "\n    s3.length() = "
szSpace:	.asciz	  " "

db1:    	.asciz    "0"			// value of the str length 
db2:    	.asciz    "0"			// value of the str length 
db3:    	.asciz    "0"			// value of the str length 

chLF:		.byte	  0x0a			// new line

strName:	.asciz	  "Collaborators: Jazmine Encarnacion, Adam Lenzini, and Yusuf Taheri\n"
strProgram:	.asciz	  "Project: RASM3\n"
strClass:	.asciz	  "Class: CS3B with Barnett\n"
strDate:	.asciz	  "Date: 4/10/2024\n\n"

test13:		.asciz	  "\n13. String_indexOf_1(s2,'g') = "					// 7
test14:		.asciz	  "\n14. String_indexOf_2(s2,'g',9) = "					// -1
test15:		.asciz	  "\n15. String_indexOf_3(s2,'' eggs '') = "				// 6
test16:		.asciz	  "\n16. String_lastIndexOf_1(s2,'g') = "				// 8
test17:		.asciz	  "\n17. String_lastIndexOf_2(s2,'g',6) = "				// -1
test18:		.asciz	  "\n18. String_lastIndexOf_3(s2,'' egg '') = "				// 6
test19:		.asciz	  "\n19. String_replace(s1,'a','o') = "					// Cot in the hot
test20:		.asciz	  "\n20. String_toLowerCase(s1) = "					// cot in the hot
test21:		.asciz	  "\n21. String_toUpperCase(s1) = " 					// COT IN THE HOT
test22:		.asciz	  "\n22. String_concat(s1, '' ''); String_concat(s1, s2) = "		// COT IN THE HOT. Green eggs and ham.

    	.text

_start:
	b	print_info

user_input:
	ldr	x0,=szPrompt1				// load address to x0
	bl	putstring				// print
	ldr	x0,=s1					// load s1 address
	mov	x1,BUFFER				// determine size buff
	bl	getstring				// user input

	ldr	x0,=szPrompt2				// load address to x0
	bl	putstring				// print
	ldr	x0,=s2					// load s2 address
	mov	x1,BUFFER				// determine size buff
	bl	getstring				// user input

	ldr	x0,=szPrompt3				// load address to x0
	bl	putstring				// print
	ldr	x0,=s3					// load s3 address
	mov	x1,BUFFER				// determine size buff
	bl	getstring				// user input

	bl	String_length
	bl	String_indexOf_1
	bl	String_indexOf_2
	bl	String_indexOf_3
	bl	String_lastIndexOf_1
	bl	String_lastIndexOf_2
	bl	String_lastIndexOf_3
	bl	String_replace
	bl	String_toLowerCase
	bl	String_toUpperCase
	bl	String_concat
	b	exit_seq


print_info:
	ldr	x0,=strName				// name address to x0 register
	bl	putstring				// print
	ldr	x0,=strProgram				// program address 
	bl	putstring				// print
	ldr	x0,=strClass				// class address
	bl	putstring				// print
	ldr	x0,=strDate				// date address
	bl	putstring				// print

	b	user_input

exit_seq:
	mov	x0, #0       			// move value 0 to x0
	mov	x8, #93       			// syscall for exit
	svc	0            			// end program

	.end




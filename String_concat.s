/* Collaborators: Adam Lenzini, Jazmine Encarnacion, Yusuf Taheri
*  String_concat
*  Purpose: Take two strings, and combine them into one
*  Date Last Modified: 11 April, 2024
*/

   .global String_concat

   .data
newPtr:	.quad 0

   .text
String_concat:
   str	x30,[SP,#-16]!	// push x30 onto the stack
   str	x0,[SP,#-16]!	// push x0 onto the stack
   str	x1,[SP,#-16]!	// push x1 onto the stack

   bl	String_length	// branch and link to String_length

   mov	x2,x0		// copy x0 into x2

   ldr	x1,[SP], #16	// pop x1 off the stack
   mov	x0,x1		// copy x1 into x0
   str	x1,[SP,#-16]!	// push x1 onto the stack
   str	x2,[SP,#-16]!	// push x2 onto the stack

   bl	String_length	// branch and link to String_length

   mov	x3,x0		// copy x0 into x3
   ldr	x2,[SP], #16	// pop x2 off the stack

   add	x0,x3,x2	// add x3 and x2 and store in x0
   add	x0,x0,#1	// add 1 to x0

   str	x2,[SP,#-16]!	// push x2 onto the stack
   str	x3,[SP,#-16]!	// push x3 onto the stack

   bl	malloc		// branch and link to malloc

   ldr	x1,=newPtr	// load the address of newPtr to x1
   str	x0,[x1]		// store x0 in x1

   ldr	x4,[SP], #16	// pop x4 off the stack
   ldr	x3,[SP], #16	// pop x3 off the stack
   ldr	x2,[SP], #16	// pop x2 off the stack
   ldr	x1,[SP], #16	// pop x1 off the stack
   //ldr	x30,[SP], #16
   mov	x5,#0		// copy 0 into x5
   mov	x6,#0		// copy 0 into x5
   ldr	x0,=newPtr	// load the address of newPtr to x0
   ldr	x0,[x0]		// load the value of newPtr to x0

copy_first:
   //ldrb	w3,[x0]
   cmp	x5, x3		// compare x5 and x3
   beq	copy_second	// branch to copy_second if x5 and x3 are equal

   ldrb	w7,[x1, x5]	// load a byte from x1 offset by x5 to w7
   strb	w7,[x0, x5]	// store a byte from w7 into x0 offset by x5

   //add	x0,x0,#1
   add	x5,x5,#1	// add 1 to x5

   b	copy_first	// branch back to copy_first

copy_second:
   cmp	x6, x4		// compare x6 and x4
   beq	move_copy	// branch to move_copy if x6 and x4 are equal

   ldrb	w7,[x2, x6]	// load a byte from x2 offset by x6 to w7
   strb	w7,[x0, x5]	// store a byte from w7 into x0 offset by x5

   add	x5,x5,#1	// add 1 to x5
   add	x6,x6,#1	// add 1 to x6

   b	copy_second	// branch back to copy_second

move_copy:
   ldr	x0,=newPtr	// load the address of newPtr to x0
   ldr	x0,[x0]		// load the value of newPtr to x0
   //bl	free
   ldr	x30,[SP], #16	// pop x30 off the stack
   RET	LR		// return to the address contained in the link register
   .end


/* Programmer: Adam Lenzini
*  String_equals
*  Purpose: Check to see if two strings are equal to each other. If not,
*	    return 0. If yes, return 1
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/

   .data

   .global String_equals

   .text
String_equals:
   str	x30,[SP, #-16]!	// Push x30 onto the stack pointer
   str	x0,[SP, #-16]!	// Push x0 onto the stack pointer
   str	x1,[SP, #-16]!	// Push x1 onto the stack pointer

   bl	String_length	// branch and link to String_length

   mov	x3, x0		// copy x0 to x3

   ldr	x1,[SP], #16	// Pop x1 off the stack
   mov	x0, x1		// copy x1 into x0
   str	x1,[SP, #-16]!	// Push x1 onto the stack pointer
   str	x3,[SP, #-16]!  // Push x3 onto the stack pointer
   bl	String_length	// branch and link to String_length

   mov	x4, x0		// copy x0 to x4
   ldr	x3,[SP], #16	// Pop x3 off the stack
   ldr	x1,[SP], #16	// Pop x1 off the stack
   ldr	x0,[SP], #16	// Pop x0 off the stack
   ldr	x30,[SP], #16	// Pop x30 off the stack

   cmp	x3, x4		// compare x3 to x4
   bne	not_equal	// branch to not_equal if x3 is not equal to x4

   mov	x2, #1		// copy 1 to x2

equals_loop:
   ldrb	w3,[x0]		// load a byte from x0 to w3
   ldrb w4,[x1]		// load a byte from x1 to w4

   cmp	w3,0x00		// compare w3 to 0x00/0
   beq	finish		// branch to finish if w3 is equal to 0x00

   cmp	w3, w4		// compare w3 to w4
   bne	not_equal	// branch to not_equal if w3 is not equal to w4

   add	x0,x0,#1	// add 1 to x0 and store in x0
   add	x1,x1,#1	// add 1 to x1 and store in x1

   b	equals_loop	// branch to equals_loop

not_equal:
   mov	x2, #0		// copy 0 into x2

finish:
   mov	x0, x2		// copy x2 to x0

   RET	LR		// return to the address contained in the link register

   .end

/* Programmer: Adam Lenzini
*  String_equalsIgnoreCase
*  Purpose: Compares two strings to see if they are equal, ignoring any
*	    differences in casing. Returns a 1 if they are the same, or
*	    a zero if they are different
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/
   .data

   .global String_equalsIgnoreCase

   .text
String_equalsIgnoreCase:
   str	x30,[SP, #-16]!	// Push x30 onto the stack pointer
   str	x0,[SP, #-16]!	// Push x0 onto the stack pointer
   str	x1,[SP, #-16]!	// Push x1 onto the stack pointer

   bl	String_length	// Branch and link to String_length

   mov	x2, x0		// copy x0 into x2

   ldr	x1,[SP], #16	// pop x1 off the stack pointer
   mov	x0, x1		// copy x1 into x0

   str	x1,[SP, #-16]!	// Push x1 onto the stack pointer
   str	x2,[SP, #-16]!	// Push x2 onto the stack pointer

   bl	String_length	// branch and link to String_length

   mov	x3,x0		// copy x0 into x3
   ldr	x2,[SP], #16	// pop x2 off the stack pointer
   ldr	x1,[SP], #16	// pop x1 off the stack pointer
   ldr	x0,[SP], #16	// pop x0 off the stack pointer
   ldr	x30,[SP], #16	// pop x30 off the stack pointer

   cmp	x2, x3		// compare x2 and x3
   bne	not_equal	// branch to not_equal if x2 is not equal to x3

   mov	x2, #1		// copy 1 into x2

equals_loop:
   ldrb	w4,[x0]		// load a byte of x0 into w4
   cmp	w4,#0		// compare w4 to 0/0x00
   beq	finish		// branch to finish if w4 is equal to 0

   ldrb	w5,[x1]		// load a byte of x1 into w5

   cmp	w4,w5		// compare w4 to w5
   beq	next		// branch to next if w4 is equal to w5

   add	w4,w4,#32	// add #32/0x20 to w4 and store in w4
   cmp	w4,w5		// compare w4 to w5
   bne	not_equal	// branch to not_equal if w4 is not equal to w5

next:
   add	x0,x0,#1	// add 1 to x0 and store in x0
   add	x1,x1,#1	// add 1 to x1 and store in x1

   b	equals_loop	// branch back to equals_loop

not_equal:
   mov	x2,#0

finish:
   mov	x0,x2		// copy x2 to x0

   RET	LR		// return to the address contained in the link register
   .end

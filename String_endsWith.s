/* Programmer: Adam Lenzini
*  String_endsWith
*  Purpose: Receives a string and a substring and returns a 1 if the 
            string ends with the substring, and a 0 otherwise
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/

   .data

   .global String_endsWith

   .text
String_endsWith:
   str	x1,[SP, #-16]! // push x1 onto the stack pointer
   str	x30,[SP, #-16]!   // push x30 onto the stack pointer
   str	x0,[SP, #-16]! // push x0 onto the stack pointer

   mov	x0,x1 // copy x1 into x0

   bl	String_length  // branch and link to String_length

   mov	x2,x0 // copy x0 to x2

   ldr	x0,[SP], #16   // pop x0 off the stack

   str	x2,[SP, #-16]! // push x2 onto the stack pointer
   str	x0,[SP, #-16]! // push x0 onto the stack pointer

   bl	String_length  // branch and link to String_length

   mov	x3,x0 // copy x0 to x3

   ldr	x0,[SP], #16   // pop x0 off the stack
   ldr	x2,[SP], #16   // pop x2 off the stack
   ldr	x30,[SP], #16  // pop x30 off the stack
   ldr	x1,[SP], #16   // pop x1 off the stack

   sub	x2, x3, x2  // subtract x2 from x3 and store in x2

   add	x0, x0, x2  // add x0 and x2 and store in x0

   mov	x2, #1   // copy 1 into x2

ends_with_loop:
   ldrb	w3,[x1]  // load a byte from x1 into w3
   cmp	w3,#0 // compare w3 and 0/0x00
   beq	finish   // branch to finish if w3 is equal to w3

   ldrb	w4,[x0]  // load a byte from x0 to w4
   cmp	w3,w4 // compare w3 and w4
   bne	not_equal   // branch to not_equal if w3 is not equal to w4

   add	x0,x0,#1 // add 1 to x0 and store in x0
   add	x1,x1,#1 // add 1 to x1 and store in x1

   b	ends_with_loop // branch to ends_with_loop

not_equal:
   mov	x2,#0 // copy 0 into x2

finish:
   mov	x0, x2   // copy x2 to x0

   RET	LR // return to the address stored in the link regiser
   .end

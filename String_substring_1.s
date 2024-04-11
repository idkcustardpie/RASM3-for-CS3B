/* Programmer: Adam Lenzini
*  String_substring_1
*  Purpose: Create a dynamically allocated string, and copy the substring
*           of a string from one character to another into it
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/

   .global String_substring_1

   .data
ptrSubstring:	.quad 0  //pointer to contain the dynamically allocated string

   .text
String_substring_1:
   sub	x3, x2, x1  // Subtract x1 from x2 and store into x3

   str	x0,[SP, #-16]!	// push x0 onto the stack
   str	x1,[SP, #-16]!	// push x1 onto the stack
   str	x2,[SP, #-16]!	// push x2 onto the stack
   str	x30,[SP, #-16]!   // push x30 onto the stack

   mov	x0, x3   // copy x3 into x0

   bl	malloc   // branch and link to malloc

   ldr	x1,=ptrSubstring  // load address of ptrSubstring to x1
   str	x0,[x1]  // store the memory block from malloc into ptrSubstring

   ldr	x30,[SP], #16  // pop x30 off the stack
   ldr	x3,[SP], #16	// pop x3 off the stack
   ldr	x2,[SP], #16	// pop x2 off the stack
   ldr	x1,[SP], #16	// pop x1 off the stack

   ldr	x0,=ptrSubstring  //load address of ptrSubstring to x0
   ldr	x0,[x0]		// load address of the string pointed to by ptrSubstring to x1
   add	x1, x1, x2  // add x1 to x2 and store in x1
   //mov	x5, x3

loop:
   cmp	x2, x3   // compare x2 to x3
   bge	finish   // branch to finish if x2 is greater than or equal to x3

   ldrb	w4,[x1]  // load a byte from x1 to w4
   strb	w4,[x0]  // store a byte from w4 to x0

   add	x0, x0, #1  // add 1 to x0 and store in x0
   add	x1, x1, #1  // add 1 to x1 and store in x1
   add	x2, x2, #1  // add 1 to x2 and store in x2

   b	loop  // branch back to loop

finish:
   //sub	x0, x0, x3
   ldr	x0,=ptrSubstring  //load address of ptrSubstring to x0
   ldr	x0,[x0]  // load the address pointed to by ptrSubstring to x0

   //bl	putstring

   RET	LR // Return to the address stored in the link register

   .end

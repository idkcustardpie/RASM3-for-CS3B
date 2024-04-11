/************************************************************************
*  Collaborators: Adam Lenzini, Jazmine Encarnacion, Yusuf Taheri
*  String_substring_2
*  Purpose: Create a dynamically allocated string, and copy the substring
*           of a string from after a certain character into it
*  Date Last Modified: 4/11/24
*************************************************************************/

   .global String_substring_2

   .data
ptrSubstring_2:	.quad 0		//pointer to contain the dynamically allocated string

   .text
String_substring_2:
   str	x30,[SP, #-16]!   	// push x30 onto the stack
   str	x0,[SP, #-16]!    	// push x0 onto the stack
   str	x1,[SP, #-16]!    	// push x1 onto the stack

   bl	String_length  			// branch and link to String_length

   ldr	x1,[SP], #16   		// pop x1 off the stack
   sub	x0, x0, x1  			// subtract x1 from x0 and store in x0
   str	x1,[SP, #-16]! 		// push x1 onto the stack

   bl	malloc   					// branch and link to malloc

   ldr	x1,=ptrSubstring_2   // load the address of ptrSubstring_2 to x1
   str	x0,[x1]     			// store the memory allocated from malloc into the address of x1

   ldr	x1,[SP], #16   		// pop x1 off the stack
   ldr	x0,[SP], #16   		// pop x0 off the stack
   ldr	x30,[SP], #16  		// pop x30 off the stack

   ldr	x2,=ptrSubstring_2   // load the address of ptrSubstring_2 to x2
   ldr	x2,[x2]  				// load address of the string pointed to by ptrSubstring_2 to x2
   add	x0,x0,x1 				// add x0 and x1 and store in x0

sub_copy_loop:
   ldrb	w4,[x0]  				// load a byte from x0 into w4
   cmp	w4,0x00  				// compare w4 to 0/0x00
   beq	sub_finish  			// branch to sub_finish if w4 is equal to 0x00

   strb	w4,[x2]  				// store a byte from w4 into x2

   add	x0,x0,#1 				// add 1 to x0 and store in x0
   add	x2,x2,#1 				// add 1 to x2 and store in x2

   b	sub_copy_loop  			// branch to sub_copy_loop

sub_finish:
   ldr	x0,=ptrSubstring_2   // load address of ptrSubstring_2 to x0
   ldr	x0,[x0]    				// load address of the string pointed to by ptrSubstring_2 to x0

   RET	LR 						// Return to the address stored in the link register

   .end

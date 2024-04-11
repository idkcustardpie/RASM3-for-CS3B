/*****************************************************************
*  Collaborators: Yusuf Taheri, Adam Lenzini, Jazmine Encarnacion
*  String_lastIndexOf_1
*  Purpose: Locate the last index in which a certain letter of
*				a string is found
*  Date: 4/11/24
*****************************************************************/
	.data

	.global String_lastIndexOf_1

	.text
String_lastIndexOf_1:
	str   x30, [SP, #-16]!		// Push x30(LR) onto the stack
	str   x0, [SP, #-16]!		// Push x0(String address) onto the stack
	str   x1, [SP, #-16]!		// Push x1(letter) on the stack

   bl    String_length			// Branch link to String_length

   sub   x5, x0, #1				// Subtract 1 from the string length(last index)
										// Store into x5

	ldr	x1, [SP], #16			// Pop x1(letter) off the stack
	ldr	x0, [SP], #16			// Pop x0(String address) off the stack
	ldr	x30,[SP], #16			// Pop x30(LR) off the stack

search_loop:
   ldrb  w2, [x0, x5]			// Load the byte(x5) of the string into w2
   cmp   w2, #'g'					// Compare the current character of the string against g
   b.eq  exit						// Branch to exit if the current character equals g

   sub   x5, x5, #1				// Decrement x5(the byte)
   cmp   x5, #-1					// Compare x5(the byte) and -1
   b.gt  search_loop				// Branch to search_loop if x5 has not
										// reached -1(the beginning of the string)

exit:
   mov   x0, x5					// Mov the index that has been found(x5) into x0

	RET		LR						// Return to the address contained in the Link Register

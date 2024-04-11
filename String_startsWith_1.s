/* Collaborators: Adam Lenzini, Jazmine Encarnacion, Yusuf Taheri
*  String_startsWith_1
*  Purpose: Receives a string, an index, and a substring and returns a 1 if
            the string starts with the substring at that index, and a 0 otherwise
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/

   .data

   .global String_startsWith_1

   .text
String_startsWith_1:
   mov	x3, #1   // copy 1 into x3
   add	x0,x0,x1 // add x0 and x1 and store in x0

starts_with_loop:
   ldrb	w1,[x2]  // load a byte from x2 into w1
   cmp	w1, 0x00 // compare w1 and 0/0x00
   beq	finish   // branch to finish if w1 is equal to 0x00

   ldrb	w4,[x0]  // load a byte from x0 into w4
   cmp	w1, w4   // compare w1 and w4
   bne	not_equal   // branch to not_equal if w1 and w4 are not equal

   add	x0,x0,#1 // add 1 to x0 and store in x0
   add	x2,x2,#1 // add 1 to x2 and store in x2

   b	starts_with_loop  // branch to starts_with_loop

not_equal:
   mov	x3, #0   // copy 0 into x3

finish:
   mov	x0, x3   // copy x3 into x0

   RET	LR // return to the address stored in the link regiser
   .end

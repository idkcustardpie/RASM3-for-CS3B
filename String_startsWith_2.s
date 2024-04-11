/* Collaborators: Adam Lenzini, jazmine Encarnacion, Yusuf Taheri
*  String_startsWith_1
*  Purpose: Receives a string and a substring and returns a 1 if the 
            string starts with the substring, and a 0 otherwise
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/

   .data

   .global String_startsWith_2

   .text
String_startsWith_2:
   mov	x3, #1   // copy 1 to x3

starts_loop:
   ldrb	w2,[x1]  // load a byte from x1 to w2
   cmp	w2,#0    // compare w2 and 0/0x00
   beq	finish   // branch to finish if w2 is equal o 0x00

   ldrb	w4,[x0]  // load a byte from x0 into w4
   cmp	w2, w4   // compare w2 and w4
   bne	not_equal   // branch to not_equal if w2 and w4 are not equal

   add	x0,x0,#1 // add 1 to x0 and store in x0
   add	x1,x1,#1 // add 1 to x1 and store in x1

   b	starts_loop // branch to starts_loop

not_equal:
   mov	x3, #0   // copy 0 to x3

finish:
   mov	x0, x3   // copy x3 to x0

   RET	LR // return to the address stored in the link regiser
   .end

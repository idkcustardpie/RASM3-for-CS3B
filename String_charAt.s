/* Programmer: Adam Lenzini
*  String_charAt
*  Purpose: Receives a string and an index, and returns the character located
            at that index in the string
*  Author: Adam Lenzini
*  Date Last Modified: 10 April, 2024
*/

   .data

   .global String_charAt

   .text
String_charAt:
   add	x0,x0,x1 // add x0 and x1 and store in x0
   ldrb	w0,[x0]  // load a byte from x0 into w0

   RET	LR // return to the address stored in the link regiser

   .end

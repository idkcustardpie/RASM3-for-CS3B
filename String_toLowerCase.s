/*****************************************************************
*  Collaborators: Yusuf Taheri, Adam Lenzini, Jazmine Encarnacion
*  String_toLowerCase_1
*  Purpose: Turn the string into all lower case characters
*  Date Last Modified: 4/11/24
*****************************************************************/

	.global	String_toLowerCase

String_toLowerCase:
    //blank

lowercase_loop:
    ldrb  w1, [x0]              // Load the byte (character) of the string into w1

    cmp   w1, #'A'              // Compare the character with 'A'
    blt   not_uppercase         // If not uppercase, check if it's the end of the string or lowercase

    cmp   w1, #'Z'              // Compare the character with 'Z'
    bgt   not_uppercase         // If not uppercase, check if it's the end of the string or lowercase

    add   w1, w1, #32           // Convert uppercase to lowercase by adding the ASCII difference directly
    strb  w1, [x0]              // Store the converted character back into the string

not_uppercase:
    cmp   w1, #0                // Check if we've reached the end of the string (null terminator)
    beq   done_conversion1      // If yes, exit the loop

    add   x0, x0, #1            // Move to the next character in the string
    b     lowercase_loop        // Repeat the loop for the next character

done_conversion1:
    RET		LR						  // Return to the address in the Link Register

    .end

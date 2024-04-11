/*****************************************************************
*  Collaborators: Yusuf Taheri, Adam Lenzini, Jazmine Encarnacion
*  String_toUpperCase_1
*  Purpose: Turn the entire string to all uppercase characters
*  Date Last Modified: 4/11/24
*****************************************************************/

	.global	String_toUpperCase

String_toUpperCase:
	// blank

uppercase_loop:
    ldrb  w1, [x0]              // Load the byte (character) of the string into w1

    cmp   w1, #'a'              // Compare the character with 'a'
    blt   not_lowercase         // If not lowercase, check if it's the end of the string or uppercase

    cmp   w1, #'z'              // Compare the character with 'z'
    bgt   not_lowercase         // If not lowercase, check if it's the end of the string or uppercase

    sub   w1, w1, #32           // Convert lowercase to uppercase by subtracting the ASCII difference directly
    strb  w1, [x0]              // Store the converted character back into the string

not_lowercase:
    cmp   w1, #0                // Check if we've reached the end of the string (null terminator)
    beq   done_conversion       // If yes, exit the loop

    add   x0, x0, #1            // Move to the next character in the string
    b     uppercase_loop        // Repeat the loop for the next character

done_conversion:
	 RET		LR						  // Return to the address in the Link Register

    .end

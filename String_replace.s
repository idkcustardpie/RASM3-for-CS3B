	.global	String_replace

String_replace:
    ldr   x0, =test19           // Load address of test string into x0
    bl    putstring             // Print the test string

    ldr   x0, =s1               // Load address of s1 (your string) into x0

replace_loop:
    ldrb  w1, [x0]              // Load the byte (character) of the string into w1

    cmp   w1, #'a'              // Compare the character with 'a'
    bne   check_end             // If not 'a', check if it's the end of the string

    mov   w1, #'o'              // Replace 'a' with 'o'

    strb  w1, [x0]              // Store the modified character back into the string

check_end:
    cmp   w1, #0                // Check if we've reached the end of the string (null terminator)
    beq   done_replace          // If yes, exit the loop

    add   x0, x0, #1            // Move to the next character in the string
    b     replace_loop          // Repeat the loop for the next character

done_replace:
    // Print the modified string
    ldr   x0, =s1               // Load address of s1 into x0
    bl    putstring             // Print the modified string
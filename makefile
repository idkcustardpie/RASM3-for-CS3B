all:
	as -g -o String_substring_2.o String_substring_2.s
	as -g -o String_substring_1.o String_substring_1.s
	as -g -o String_startsWith_2.o String_startsWith_2.s
	as -g -o String_startsWith_1.o String_startsWith_1.s
	as -g -o String_equalsIgnoreCase.o String_equalsIgnoreCase.s
	as -g -o String_equals.o String_equals.s
	as -g -o String_endsWith.o String_endsWith.s
	as -g -o String_copy.o String_copy.s
	as -g -o String_charAt.o String_charAt.s

	as -g -o String_length.o String_length.s
	as -g -o String_toUpperCase.o String_toUpperCase.s
	as -g -o String_concat.o String_concat.s
	as -g -o String_replace.o String_replace.s
	as -g -o String_indexOf_1.o String_indexOf_1.s 
	as -g -o String_indexOf_2.o String_indexOf_2.s
	as -g -o String_indexOf_3.o String_indexOf_3.s 
	as -g -o String_lastIndexOf_1.o String_lastIndexOf_1.s 
	as -g -o String_lastIndexOf_2.o String_lastIndexOf_2.s 
	as -g -o String_lastIndexOf_3.o String_lastIndexOf_3.s 
	as -g -o String_toLowerCase.o String_toLowerCase.s 
	as -g -o driver.o driver.s

	ld -o RASM3 /usr/lib/aarch64-linux-gnu/libc.so driver.o -dynamic-linker /lib/ld-linux-aarch64.so.1 ../obj/putstring.o ../obj/putch.o ../obj/ascint64.o ../obj/hex64asc.o ../obj/int64asc.o ../obj/getstring.o ../RASM3/String_length.o ../RASM3/String_replace.o ../RASM3/String_toUpperCase.o ../RASM3/String_concat.o ../RASM3/String_indexOf_1.o ../RASM3/String_indexOf_2.o ../RASM3/String_indexOf_3.o ../RASM3/String_lastIndexOf_1.o ../RASM3/String_lastIndexOf_2.o ../RASM3/String_lastIndexOf_3.o ../RASM3/String_toLowerCase.o ../RASM3/String_substring_1.o ../RASM3/String_substring_2.o ../RASM3/String_startsWith_1.o ../RASM3/String_startsWith_2.o ../RASM3/String_equals.o ../RASM3/String_equalsIgnoreCase.o ../RASM3/String_endsWith.o ../RASM3/String_copy.o ../RASM3/String_charAt.o

PHONY: clean
	
clean: rm -f *.o run *-
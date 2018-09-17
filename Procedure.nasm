; Procedure.nasm
; Author: Arch3y

global _start

section .text

MessagePrint:
	enter 0, 0; executes push ebp mov ebp, esp to create a stack frame
	mov eax, 0x4; write syscall defined with syscall 4 for write
        mov ebx, 0x1; file descriptor 1 being stdout
        mov ecx, message; the buffer that contains our message to print
        mov edx, mlen; size of the message that we want to write, is dynamically found by the code in the data segement
        int 0x80; interrupt the kernel to execute our defined syscall

	leave; tears down our created stack frame
	ret; end of function call 	

_start:
	; 10 is 0xA in hex
	mov ecx, 0xA; move 10 bytes into ecx to start our counter loop should print 10 times

Print:
	pushad; pushes all registers to the stack to preserve them
	pushfd; pushes all flags to the stack to preserve them

	call MessagePrint
	
	; restores stack and registers
	popfd;
	popad;

	loop Print; start our loop here otherwise it will never finish if this is zero it will continue on to the next instr being mov eax 0x1 to start our exit syscall

	mov eax, 0x1; write system call defined with 1 for exit
	mov ebx, 0x0; return value 0 to exit cleanly
	int 0x80; interrupt kernel to run defined syscall


section .data

	message: db "ASM Sucks!",0xa ; drops ASM Sucks! into our message buffer with a new line character
	mlen	equ $-message; automatically figures out the length of message and returns it as a number

	  

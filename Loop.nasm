; Loop.nasm
; Author: Arch3y

global _start

section .text

_start:
	jmp Begin


Begin:
	mov ecx, 0x10; move 10 bytes into ecx to start our counter loop should print 10 times

Print:
	push ecx; push to stack to hold on to the value as we will overwriting it in our print to the screen with our message

	mov eax, 0x4; write syscall defined with syscall 4 for write
	mov ebx, 0x1; file descriptor 1 being stdout
	mov ecx, message; the buffer that contains our message to print
	mov edx, mlen; size of the message that we want to write, is dynamically found by the code in the data segement
	int 0x80; interrupt the kernel to execute our defined syscall

	pop ecx; remove ecx from the stack
	loop Print; start our loop here otherwise it will never finish if this is zero it will continue on to the next instr being mov eax 0x1 to start our exit syscall

	mov eax, 0x1; write system call defined with 1 for exit
	mov ebx, 0x0; return value 0 to exit cleanly
	int 0x80; interrupt kernel to run defined syscall


section .data

	message: db "ASM Sucks!",0xa ; drops ASM Sucks! into our message buffer with a new line character
	mlen	equ $-message; automatically figures out the length of message and returns it as a number

	  

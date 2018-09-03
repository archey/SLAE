; HelloWorld.asm
; Author: Tyler

global _start

section .text

_start:
        ;dest src
	mov eax, 0x4 ; write system call defined with syscall 4 for write
	mov ebx, 0x1 ; file descriptor 1 being stdout
	mov ecx, message ; the buffer that contains the message we want to write
	mov edx, mlen ; size of the message that we want to write
	int 0x80 ; interrupt the kernel to run the syscalls defined about int 0x80

	; exit the program gracefully

	mov eax, 0x1 ; write system called defined with syscall 1 for exit
	mov ebx, 0x0 ; return value 0 to exit cleanly
	int 0x80 ; interrupt kernel to run the defined syscalls





section .data


	message: db "Hello world!",0xa ; prints hello world to the screen with a new line after it
	mlen	equ $-message


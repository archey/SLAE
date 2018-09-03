; DataTypes.asm
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

	var1:	db 0xAA ; a BYTE
	var2:	db 0xBB, 0xCC, 0xDD; a sequence of bytes
	var3: 	dw 0xEE ; a word EE is atually 2 bytes on 32bit i686
	var4:	dd 0xAABBCCDD ; 4 bytes define double word
	var5:	dd 0x112233; define double word 4 bytes
	var6:	TIMES 6 db 0xFF 

section .bss

	var7: 	resb 100; sets a reserved byte of 100
	var8:	resw 20; sets a reserved word of 20

; MovingData.nasm
; Author:  Tyler
;

global _start			

section .text
_start:

	; mov immediate data to register 

	mov eax, 0xaaaaaaaa
	mov al, 0xbb
	mov ah, 0xcc
	mov ax, 0xdddd

	mov ebx, 0
	mov ecx, 0

	; mov register to register 

	mov ebx, eax
	mov cl, al
	mov ch, ah
	mov cx, ax

	mov eax, 0
	mov ebx, 0
	mov ecx, 0

	; mov from memory into register 

	mov al, [testdata]
	mov ah, [testdata +1]
	mov bx, [testdata]
	mov ecx, [testdata]
	
	; mov from register into memory 


	mov eax, 0x33445566
	mov byte [testdata], al	
	mov word [testdata], ax
	mov dword [testdata], eax

	; mov immediate value into memory 

	mov dword [testdata], 0x33445566

	; lea demo

	lea eax, [testdata]
	lea ebx, [eax] 


	; xchg demo 
	mov eax, 0x11223344 ; mov 0x11223344 into eax
	mov ebx, 0xaabbccdd ; mov 0xaabbccdd into ebx

	xchg eax, ebx ; swap eax and ebx so move 0x11223344 into ebx and 0xaabbccdd into eax

	; push value into memory
	push 0xdeadbeef; push 0xdeadbeef to the stack
	pop eax; eax is now 0xdeadbeef
	; swapping contents of ebx and ecx
	mov ebx, 0x11223344; mov 0x11223344 into register ebx
 	mov ebx, ecx
	pop ecx
	
	; exit the program gracefully  

	mov eax, 1
	mov ebx, 0		
	int 0x80


section .data

testdata: db 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff, 0x11, 0x22





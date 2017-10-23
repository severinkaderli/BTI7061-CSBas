section	.data
	Newline:	db 0xA, 0xD	; Newline characters
	NewlineLength:	equ $ - Newline ; The length of the newline characters

section .bss

section .text
	
	GLOBAL	printText, printNewline

;******************************************************************************
; Prints a text to the console
;
; Input:	rcx: The address of the ASCII string
;		rdx: The length of the string
;
; Output:	None
;******************************************************************************
printText:
	push	rax
	push	rbx
	mov	rax, 4
	mov	rbx, 1
	int	0x80
	pop	rbx
	pop	rax
	ret

;******************************************************************************
; Prints a newline
; 
; Input:	None
;
; Output:	None
;******************************************************************************
printNewline:
	push	rcx
	push	rdx
	mov	rcx, Newline
	mov	rdx, NewlineLength
	call	printText
	pop	rdx
	pop	rcx
	ret

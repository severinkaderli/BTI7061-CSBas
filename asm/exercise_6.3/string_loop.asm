section	.data
	String: 	db "Hello, World!"
	StringLength:	equ $ - String
	PrintTimes:	db 5

section .text
	global	_start

EXTERN	printText, printNewline, convertNumberToString

_start:	
	mov 	bl, [PrintTimes]
loop:	
	mov	rcx, String
	mov	rdx, StringLength	
	call	printText
	call	printNewline
	dec	rbx
	jnz	loop

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

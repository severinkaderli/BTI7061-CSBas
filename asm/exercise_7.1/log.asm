section	.data
	Number: 	db 0x20

section	.bss
	StringBuffer:	resb 16

section .text
	global	_start

EXTERN	printText, printNewline, convertNumberToString, binaryLog

_start:
	mov	al, [Number]
	call	binaryLog
	mov	rax, rbx
	mov	rbx, StringBuffer
	call	convertNumberToString
	mov	rcx, StringBuffer
	mov	rdx, 16
	call	printText
	call	printNewline

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

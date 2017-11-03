section	.data
	Number: 	db 42

section	.bss
	StringBuffer:	resb 32

section .text
	global	_start

EXTERN	printText, printNewline, convertNumberToString, binaryLog, numberToBinaryString

_start:
	nop
	mov	al, [Number]
	mov	rbx, StringBuffer
	call	numberToBinaryString
	mov	rcx, StringBuffer
	mov	rdx, 32
	call	printText
	call	printNewline

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

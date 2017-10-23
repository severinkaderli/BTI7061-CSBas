section	.data
	Message: 	db "Hello, World!"
	MessageLength: 	equ $ - Message

section .text
	global	_start

EXTERN	printText, printNewline, convertNumberToString

_start:
	mov	rcx, Message
	mov	rdx, MessageLength
	call	printText
	call	printNewline

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

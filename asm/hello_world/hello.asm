section	.data
	Message: db "Hello, World!"
	MessageLength: equ $ - Message

section .bss

section .text
	global	_start

EXTERN	printText, printNewline

_start:
	mov	rcx, Message
	mov	rdx, MessageLength
	call	printText
	call	printNewline

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

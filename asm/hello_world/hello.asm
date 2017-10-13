section	.data
	Message: db "Hello, World!", 0xA
	MessageLength: equ $ - Message

section .bss

section .text
	global	_start

_start:
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, Message
	mov	rdx, MessageLength
	int	0x80	

	mov	rax, 1
	mov	rbx, 0
	int	0x80

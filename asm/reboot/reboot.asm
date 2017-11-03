section .text
	global	_start

_start:
	mov	rax, 88
	mov	rbx, 0xFEE1DEAD
	mov	rcx, 672274793
	mov	rdx, 0x1234567
	int	0x80

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

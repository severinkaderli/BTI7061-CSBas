section	.data
	Number:	db 0xA		; We calculate the sum of the numbers up to this one

section .bss

section .text
	global	_start

_start:
	mov	rax, 0		; We store the sum in rax
	mov	bl, [Number]	; bl holds the current number	

calculate:
	add	rax, rbx	; Add the current number to the sum
	dec	rbx		; Decrease the number
	jnz	calculate	; If not zero loop

exit:
	mov	rax, 1				
	mov	rbx, 0
	int	0x80

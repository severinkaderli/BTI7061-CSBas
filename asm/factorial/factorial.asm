section	.data
	Number:	dd 17		; We calculate the factorial of this number

section .bss

section .text
	global	_start

_start:
	mov	rax, 0		; We store the result in rax
	mov	ebx, [Number]	; bl holds the current number	
	mov	rcx, 1		; rcx will hold the high dword of the result
	add	rax, rbx	; We add the first number to rax
	dec	bl		; We decrement rbx

calculate:
	mul	ebx		; Multiplicate the result with the current number
	cmp	rdx, 0
	jle	noUpper
	call	getUpper	
noUpper:	
	dec	rbx		; Decrease the number
	cmp	rbx, 1
	jne	calculate	; If not zero loop
	jmp	putResult

getUpper:
	push	rax
	mov	rax, rdx
	mul	rcx
	mov	rcx, rax
	pop	rax
	ret

putResult:
	shl	rcx, 32
	add	rax, rcx

exit:
	mov	rax, 1				
	mov	rbx, 0
	int	0x80

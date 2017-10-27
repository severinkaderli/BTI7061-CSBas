section	.data
	Number: 	db 17
	Exponent:	db 6

section .bss
	Power:		resb 16

section .text
	global	_start

EXTERN	printText, printNewline, convertNumberToString

;******************************************************************************
; Calculates the power of a number with a given exponent.
;
; Input:	rbx: The number
; 		rcx: The exponent
;
; Output:	rax: The calculated power
;******************************************************************************
calculatePower:
	mov	rax, 1 
.exponentation:	
	mul	rbx
	dec	rcx
	jg	.exponentation
	ret

_start:	
	mov	bl, [Number]
	mov	cl, [Exponent]
	call	calculatePower
	mov	rbx, Power
	call	convertNumberToString
	mov	rcx, Power
	mov	rdx, 16
	call	printText
	call	printNewline

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

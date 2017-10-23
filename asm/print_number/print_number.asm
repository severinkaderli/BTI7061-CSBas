;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This program filters out the numbers from a string and
; and displays the numbers to the standard output.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section	.data
	Linefeed:	db 0xA

section .bss
	NumberString:	resb 16	; This is the reserved memory for number strings

section .text
	global	_start

; Converts a number to an ascii string.
;
; Input:
;	rax: The number that will be converted.
;	rbx: The memory address where the string will be stored
convertNumberToString:
	push	rax
	push	rbx 
	push	rcx
	push	rdx

	add	rbx, 15		; TODO: Don't hardcode this!
	mov	ecx, 0xA
.division:
	xor	edx, edx
	idiv	ecx		; Divide the number by 10
	add	edx, "0"	; Convert the remainder to an ASCII character
	mov	[rbx], dl	; Move the character to memory
	dec	ebx		; Decrement rbx
	cmp	eax, 0		; Check if we're finished with converting
	jg	.division	; If not we convert the next digit

	pop	rdx
	pop	rcx
	pop	rbx
	pop	rax
	ret

; Prints a linefeed character to the console
printLinefeed:
	push	rax
	push	rbx
	push	rcx
	push	rdx
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, Linefeed
	mov	rdx, 1	
	int	0x80
	pop	rax
	pop	rbx
	pop	rcx
	pop	rdx
	ret

_start:
	mov	rax, 1421004232
	mov	rbx, NumberString
	call	convertNumberToString

	
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, NumberString
	mov	rdx, 16
	int	0x80
	call	printLinefeed

exit:
	mov	rax, 1				
	mov	rbx, 0
	int	0x80

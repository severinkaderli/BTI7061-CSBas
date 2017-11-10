section	.data
	N: 		db 30
	K:	 	db 10
	
section .bss
	NumberString:	resb 16

section .text
	global	_start

EXTERN	printText, printNewline, convertNumberToString


;******************************************************************************
; Calculates the binomial coefficient
;
; Input:	rax: The n
; 		rbx: The k
;
; Output:	rcx: The binomial coefficient
;******************************************************************************
binomial:
	xor	rcx, rcx		; We use rcx as the result register
	cmp	rax, rbx		; if(rbx < rax) exit
	jl	.exit
	call	binomialCalculate	; Call the calculation procedure
.exit:	
	ret


binomialCalculate:
	mov	rcx, 1			; Set rcx to 1
	cmp	rbx, 0			; if(k == 0) exit
	je	.exit
	cmp	rax, rbx		; if(n == k) exit
	je	.exit
	push	rax			; Save n on the stack
	dec	rax			; Decrease n by one
	call	binomialCalculate	; Calculate (n - 1, k)
	push	rcx			; Push the result on the stack
	push	rbx			; Save k on the stack
	dec	rbx			; Decrease k by one
	call	binomialCalculate	; Calculate (n - 1, k - 1)
	pop	rbx			; Load k from the stack
	mov	rax, rcx		; Set rax, to the current result
	pop	rcx			; Load old result
	add	rcx, rax		; Add new and old result together
	pop	rax			; Load n back from the stack
.exit:		
	ret

_start:
	mov	al, [N]
	mov	bl, [K]
	call	binomial
	mov	rax, rcx
	mov	rbx, NumberString
	call	convertNumberToString
	mov	rcx, NumberString
	mov	rdx, 16
	call	printText
	call	printNewline

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

section	.data
	Linefeed: db 0xA
	LinefeedLength: equ $ - Linefeed
	String: db "This should work with any arbitary string.$"
	TerminationCharacter: db 0x24

section .bss

section .text
	global	_start

_start:
	mov	rax, 0 				; Stores the length of the string
	mov	rbx, String 			; Points to the address of the current character
	mov	rcx, 0 				; Contains the current character

count:
	mov	cl, [rbx] 			; Load the current character into rcx
	cmp	cl, [TerminationCharacter] 	; Check if it's a $
	je	printOriginal 			; If it's a $ go to exit
	inc	rax 				; If not increment the length
	inc	rbx 				; and the address pointer
	jmp	count 				; and loop again
	
printOriginal:
	push	rbx				; Push the address of the last character to the stack
	mov	rdx, rax			; Set rdx to the length of string we calculated
	mov	rax, 4				; sys_write
	mov	rbx, 1				; Standard output
	mov	rcx, String			; Write the original string
	int	0x80
	call	printLinefeed			; Write a line feed
		
	pop	rcx				; Pop the address of the last character into rcx
	dec	rcx				; Decrement the address so we don't write the $

printInverted:
	cmp	rcx, String			; Check if we're again at the beginning of the string
	jl	exit				; If we are we go to the end
	push	rcx				; Save rcx on the stack
	mov	rax, 4				; sys_write
	mov	rbx, 1				; Standard output
	mov	rdx, 1				; 1 character
	int	0x80	
	pop	rcx				; Pop back the address to rcx
	dec	rcx				; Decrement the character address
	jmp	printInverted			; Loop

printLinefeed:
	mov	rax, 4				; Procedure to write a linefeed
	mov	rbx, 1
	mov	rcx, Linefeed
	mov	rdx, LinefeedLength
	int	0x80
	ret

exit:
	call 	printLinefeed			; We want a final linefeed before exiting
	mov	rax, 1				
	mov	rbx, 0
	int	0x80

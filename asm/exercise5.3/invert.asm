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
	push	rax				; Push the length of the string
	push	rbx				; Push the address of the last character to the stack
	mov	rdx, rax			; Set rdx to the length of string we calculated
	mov	rax, 4				; sys_write
	mov	rbx, 1				; Standard output
	mov	rcx, String			; Write the original string
	int	0x80
	call	printLinefeed			; Write a line feed
	
invert:
	pop	rcx				; Pop the address of the last character into rcx
	dec	rcx				; Decrement the address so we don't write the $
	mov	rbx, String	

swap:
	cmp	rbx, rcx			; Compare rbx and rcx
	jge	printInverted			; If rbx is the same or greater than rbx, jump
	mov	dl, [rbx]			; Temporarily save the character from rbx
	mov	al, [rcx]			; Temporarily save the character from rcx
	mov	byte [rbx], al			; Swap character at position rbx with the one from [rcx]
	mov	byte [rcx], dl			; Swap character at position rcx with the one from [rbx]
	dec	rcx		
	inc	rbx				
	jmp	swap	


printInverted:
	pop	rdx
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, String
	int	0x80
	call 	printLinefeed
	jmp 	exit

printLinefeed:
	mov	rax, 4		
	mov	rbx, 1
	mov	rcx, Linefeed
	mov	rdx, LinefeedLength
	int	0x80
	ret

exit:
	mov	rax, 1				
	mov	rbx, 0
	int	0x80

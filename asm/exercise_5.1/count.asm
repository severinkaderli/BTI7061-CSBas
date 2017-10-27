section	.data
	String: db "Adam and Eve and live in paradise$"
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
	je	exit 				; If it's a $ go to exit
	inc	rax 				; If not increment the length
	inc	rbx 				; and the address pointer
	jmp	count 				; and loop again
	
exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

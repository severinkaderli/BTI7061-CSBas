;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This program filters out the numbers from a string and
; and displays the numbers to the standard output.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
section	.data
	String:		db "adb7fe6fds3j2$"
	Numbers:	db "              "

section .bss

section .text
	global	_start

; This procedure calculates the length of a string until a $ sign is found.
;
; Input:
;	rbx: The address of the string
; Output:
;	rax: The length of the string 
getLengthOfString:
	push	rbx
	push	rcx
	xor	rax, rax	; Set the count to 0	
.count:
	mov	cl, [rbx]	; Mov the current character to cl
	cmp	cl, 0x24 	; Check if it's a $
	je	.exit		; Yes: Go the .exit
	inc	rax 		; If not: increase the counter 
	inc	rbx		; Increment the address of the character
	jmp	.count 		; Loop another round
.exit:
	pop	rcx
	pop	rbx
	ret

; Filter out numbers from a string
;
; Input:
;	rbx: The address of the string
;	rcx: The address where the numbers will be stored
; Output:
;	The numbers will be stored at the address given with rcx
filterNumbersFromString:
	push	rbx
	push	rcx 
	push	rdx
	xor	rdx, rdx
.checkNumber:
	mov	dl, [rbx]
	cmp	dl, "$"
	je	.exit
	cmp	dl, "0"
	jl	.notANumber
	cmp	dl, "9"
	jg	.notANumber
.isNumber:
	mov	[rcx], dl
	inc	rcx
.notANumber:
	inc	rbx
	jmp	.checkNumber
.exit:
	mov	[rcx], byte "$"
	pop	rdx
	pop	rcx
	pop	rbx	
	ret

_start:
	mov	rbx, String
	mov	rcx, Numbers
	call	filterNumbersFromString

exit:
	mov	rax, 1				
	mov	rbx, 0
	int	0x80

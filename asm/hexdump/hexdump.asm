section	.data
	LookupTable:		db "0123456789ABCDEF"	; Lookup table to convert a number to its hex equivalent
	TemplateString: 	db " 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00"
	StringLength: 		equ $ - TemplateString

section .bss
	BufferLength:	equ 16
	Buffer:		resb BufferLength

section .text
	global	_start

EXTERN	printText, printNewline

_start:
	
ReadIntoBuffer:
	mov	rax, 3 
	mov	rbx, 0
	mov	rcx, Buffer
	mov	rdx, BufferLength
	int	0x80

	push	rax			; Save the number of read bytes


	xor	rcx, rcx		; rcx is our 'counter'

ConvertBytes:
	
	xor	rdx, rdx
	mov	rbx, rcx
	lea	rbx, [rbx * 2 + rbx]
	mov	dl, byte [Buffer + rcx]
	mov	al, dl

	and	al, 0x0F
	mov	al, [LookupTable + rax]
	mov	[TemplateString + rbx + 2], byte al

 
	shr	dl, 4
	mov	dl, [LookupTable + rdx]
	mov	[TemplateString + rbx + 1], byte dl

	inc	rcx
	cmp	rcx, BufferLength
	jne	ConvertBytes 	

	
	; Print out the template
	mov	rcx, TemplateString
	mov	rdx, StringLength
	call	printText
	call	printNewline

	pop	rax
	cmp	rax, 0
	jne	ReadIntoBuffer		; Continue to read if we're not at the end

exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

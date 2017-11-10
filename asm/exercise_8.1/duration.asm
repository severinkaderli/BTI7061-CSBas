section	.data
	Colon:	db ":"

section .bss
	SecondText:	resb 16
	MinuteText:	resb 16
	HourText:	resb 16


section .text
	global _start

EXTERN	printText, printNewline, convertNumberToString


;******************************************************************************
; Increments the chronometer by one second.
;
; Input:	rax: The current state of the chronometer
;
; Output:	-
;******************************************************************************
incrementChronometer:
	call	incrementSeconds
	call	getSeconds
	cmp	rbx, 60
	jl	.exit
	call	setSecondsToZero
	call	incrementMinutes	
.checkMinutes:
	call	getMinutes
	cmp	rbx, 60
	jl	.exit
	call	setMinutesToZero
	call	incrementHours
.checkHours:
	call	getHours
	cmp	rbx, 24
	jl	.exit
	call	setHoursToZero

.exit:
	ret

;******************************************************************************
; Returns the current number of seconds.
;
; Input:	rax: The current state of the chronometer
;
; Output:	rbx: The number of seconds
;******************************************************************************
getSeconds:
	push	rax
	mov	rbx, rax
	and	rbx, 0x0000003F	; Get the first 6 bits
	pop	rax
	ret

;******************************************************************************
; Returns the current number of minutes.
;
; Input:	rax: The current state of the chronometer
;
; Output:	rbx: The number of minutes
getMinutes:
	push	rax
	mov	rbx, rax
	shr	rbx, 6			; Shift right to get to the minutes
	and	rbx, 0x0000003F 	; Get the first 6 bits
	pop	rax
	ret

setSecondsToZero:
	and	rax, 0xFFC0
	ret

setMinutesToZero:
	and	rax, 0xF03F
	ret

setHoursToZero:
	and	rax, 0x0FFF
	ret	

incrementSeconds:
	call	getSeconds
	call	setSecondsToZero
	inc	rbx
	or	rax, rbx
	ret

incrementMinutes:
	call	getMinutes
	call	setMinutesToZero
	inc	rbx
	shl	rbx, 6
	or	rax, rbx
	ret

incrementHours:
	call	getHours
	call	setHoursToZero
	inc	rbx
	shl	rbx, 12
	or	rax, rbx
	ret


;******************************************************************************
; Returns the current number of hours.
;
; Input:	rax: The current state of the chronometer
;
; Output:	rbx: The number of hours
;******************************************************************************
getHours:
	push	rax
	mov	rbx, rax
	shr	rbx, 0xC
	and	rbx, 0x0000000F
	pop	rax
	ret

printColon:
	push	rcx
	push	rdx
	mov	rcx, Colon
	mov	rdx, 1
	call	printText
	pop	rdx
	pop	rcx
	ret

printTime:
	push	rbx
	push	rcx
	push	rdx	
	push	rax
	call	getSeconds
	mov	rax, rbx
	mov	rbx, SecondText
	call	convertNumberToString
	pop	rax
	push	rax
	call	getMinutes
	mov	rax, rbx
	mov	rbx, MinuteText
	call	convertNumberToString
	pop	rax
	push	rax
	call	getHours
	mov	rax, rbx
	mov	rbx, HourText
	call	convertNumberToString
	mov	rcx, HourText
	mov	rdx, 16
	call	printText
	call	printColon
	mov	rcx, MinuteText
	mov	rdx, 16
	call	printText
	call	printColon
	mov	rcx, SecondText
	mov	rdx, 16
	call	printText
	call	printNewline
	pop	rax
	pop	rdx
	pop	rcx
	pop	rbx
	ret
_start:
	xor	rax, rax		; rax is the timer
	mov	eax, 1100011111111011b	; Set initial time to 12:31:59
	mov	rcx, 100
.inc	
	call	incrementChronometer
	call	printTime
	loop	.inc
exit:
	mov	rax, 1
	mov	rbx, 0
	int	0x80

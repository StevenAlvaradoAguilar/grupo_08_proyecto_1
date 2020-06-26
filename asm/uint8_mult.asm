; Description of the program:
; Author: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Day: 21/06/2020

;Title of the class
TITLE uint8_mult(uint8_mult.asm)

;We include the libraries links to Irvine so we can call the Irvine procedures
include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib
include Mult.inc ;We include an .inc file that declares a prototype of the function

.data
;The variable Str contains the text that will be printed to the screen
Str1 BYTE "The result is = ", 0 
Result WORD 0b

; Calculate the multiplication of two 8-bit integers.
; Receives: 
; Multiplicand
; Multiplier
; Returns: EAX = result
;-----------------------------------------------------
.code
uint8_mult PROC multiplicand:BYTE, multiplier:BYTE

	push CX				; save registers
	push DX
	push SI

	xor DX, DX			; DX := 0 (keeps mult. result)
	mov AL, multiplicand 
	mov CX, AX			;CX := # of shifts required
	mov SI, AX			; save original number in SI
repeat1:				; multiply loop - iterates multiplier times
	mov BL,	multiplier
	rol BL,	1			;test bits of number2 from left
	jnc skip1			; if 0, do nothing
	mov AX, SI			; else, AX := number1*bit weight
	shl AX, CL
	add DX, AX			; update running total in DX
skip1:
	loop repeat1
	rol BL, 1			; test the rightmost bit of AL
	jnc skip2			; if 0, do nothing
	add DX, SI			; else, add number1
skip2:
	mov AX, DX			; move final result into AX
	mov Result, ax		;Mueve el multiplicación al registro ax

	mov EDX, OFFSET Str1	;Le pasamos lo del string 
	call WriteString		;Hace una llamada a la función 
	MOV ax, Result
	call WriteDec			;muestra EAX
	call Crlf				;Hace una llamada a la función

	pop SI					; restore registers
	pop DX
	pop CX
	ret						;It returns to previous function (Main)				

uint8_mult ENDP
END

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

	MOV AL, muLtiplicand
	mov BL, multiplier  
	mov ECX, 8			;CX := # of shifts required
	mov ESI, 0			; save original number in SI
	mov DX, Result		;Mueve el multiplicación al registro ax

L1:
	push ebx
	AND BL, 1
	CMP BL, 1
	SHL SI, CL

	MOV result, BX
	mov EDX, OFFSET Str1	;Le pasamos lo del string 
	call WriteString		;Hace una llamada a la función 
	MOV ax, Result
	call WriteDec			;muestra EAX
	call Crlf				;Hace una llamada a la función
	ret						;It returns to previous function (Main)				

uint8_mult ENDP
END

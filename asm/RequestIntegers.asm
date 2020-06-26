; Description of the program:
; Author: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Day: 21/06/2020

;Title of the class
TITLE Request Integers (RequestIntegers.asm)

;We include the libraries links to Irvine so we can call the Irvine procedures
include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib
include Mult.inc ;We include an .inc file that declares a prototype of the function

.data
Str1 BYTE "Ingrese el primer numero entero", 0ah, 0dh, 0	;The variable Str contiene el texto que va ser impreso en pantalla
Str2 BYTE "Ingrese el segundo numero entero", 0ah, 0dh, 0	;The variable Str contiene el texto que va ser impreso en pantalla
Str3 BYTE "Error debe ingresar un número entero", 0ah, 0dh, 0	;The variable Str contiene el texto que va ser impreso en pantalla
Multiplicand SWORD ?
Multiplier SWORD ?


.code
;----------------------------------------------------
; Prompts the user for two integers 
RequestIntegers PROC

Num1:
	MOV edx, OFFSET Str1		
	CALL WriteString		
	CALL ReadDec			;cin >>Multiplier
	MOV Multiplicand, ax	

	.IF Multiplicand > 255 || Multiplicand < 0  ;Validation to assure that the number is one byte
        mov edx, OFFSET Str3  
        call WriteString        ;It shows the message error "Error debe ingresar un número entero"
        call WaitMsg
        call Clrscr             ;It clears the screen
        jmp Num1                ;It jumps to Num1 location to request the first number again
	.ENDIF

Num2:
	MOV edx, OFFSET Str2			
	call WriteString		
	CALL ReadDec			;Call procedure read decimal
	MOV Multiplier, ax		

	 .IF Multiplier > 255 || Multiplier < 0  ;Validation to assure that the number is one byte
        mov edx, OFFSET Str3  
        call WriteString        ;It shows the message error "Error debe ingresar un número entero "
        call WaitMsg
        call Clrscr             ;It clears the screen
        jmp Num2                ;It jumps to Num2 location to request the second number again
	.ENDIF

	MOV bx, Multiplicand
	ret								;It returns to previous function (Main), with EBX=num1 and EAX=num2

RequestIntegers ENDP
END
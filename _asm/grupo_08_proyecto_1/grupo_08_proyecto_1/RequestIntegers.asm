; Descripcion del Programa:
; Autor: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Dia: 21/06/2020

TITLE Request Integers (menu.asm)
.386
.model flat, stdcall
.stack 4096

;Libraries
include c:\Irvine\Irvine32.inc
include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib
include Mult.inc

.data
;Assign the variables
Multiplier BYTE 0
Index1 BYTE 0

.code
;----------------------------------------------------
RequestIntegers PROC
; Askes the user for two whole numbers. 
; With the input from the user.
; Resives:
; ptrIndicator:PTR BYTE ; Numbers from the user

ptrIndicator EQU [EBP+2]

	pushad ; Saves all the registers

	mov cl, Multiplier
	cmp cl, 0 ; ¿Size of the array is  <= 0?
	jle L2 ; sí: termina
	mov dl, ptrIndicator ; Direccion of the Indicator
	mov si, Multiplier

L1: call WriteString ; Shows the chain
	call ReadInt ; Reads whole number and places it in EAX
	call Crlf ; Advances to the next exit line
	mov [si], al ; Saves it to the array
	add si, 2 ; Next whole number 
	loop L1

L2: popad ;Refreshes all the registers
	leave
	ret  ; Refreshes the stack

RequestIntegers ENDP
END

WriteString PROC
ReadInt PROC
Crlf PROC
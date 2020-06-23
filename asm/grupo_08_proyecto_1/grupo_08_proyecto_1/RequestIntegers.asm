; Descripcion del Programa:
; Autor: Steven Alvarado Aguilar, Andres Lop�z S�nchez, Fabian Lop�z S�nchez
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
; Pide al usuario dos n�meros enteros 
; con la entrada del usuario.
; Recibe:
; ptrIndicator:PTR BYTE ; n�meros del usuario

ptrIndicator EQU [EBP+2]

	pushad ; guarda todos los registros

	mov cl, Multiplier
	cmp cl, 0 ; �tama�o del arreglo <= 0?
	jle L2 ; s�: termina
	mov dl, ptrIndicator ; direcci�n del indicador
	mov si, Multiplier

L1: call WriteString ; muestra la cadena
	call ReadInt ; lee entero y lo coloca en EAX
	call Crlf ; avanza a la siguiente l�nea de salida
	mov [si], al ; lo almacena en el arreglo
	add si, 2 ; siguiente entero
	loop L1

L2: popad ; restaura todos los registros
	leave
	ret  ; restaura la pila

RequestIntegers ENDP
END

WriteString PROC
ReadInt PROC
Crlf PROC
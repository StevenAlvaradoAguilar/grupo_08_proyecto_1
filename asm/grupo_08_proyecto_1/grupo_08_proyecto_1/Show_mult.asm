; Descripcion del Programa:
; Autor: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Dia: 21/06/2020

TITLE Procedimiento Show Mult (ShowMult.asm)
.386
.model flat, stdcall
.stack 4096 

ExitProcess PROTO, dwExitCode:DWORD

;Libraries
include c:\Irvine\Irvine32.inc
include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib
include Mult.inc

.code
;-----------------------------------------------------
Show_mult PROC
; Muestra la suma en la consola.
; Recibe:
; ptrIndicador ; desplazamiento de la cadena indicadora
; laSuma ; la suma del arreglo (WORD)
; Devuelve: nada
;-----------------------------------------------------
theMult:WORD
ptrIndicator:PTR BYTE
	push eax
	push edx
	mov edx, ptrIndicator ; apuntador al indicador
	call WriteString
	mov ax, theMult
	call WriteInt ; muestra EAX
	call Crlf
	pop edx
	pop eax
	leave
	ret  ; restaura la pila
Show_mult ENDP
END

WriteString PROC
WriteInt PROC
Crlf PROC
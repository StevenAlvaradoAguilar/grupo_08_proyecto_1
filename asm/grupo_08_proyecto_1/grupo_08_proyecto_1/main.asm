; Descripcion del Programa:
; Autor: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Dia: 21/06/2020

TITLE Proyecto_1(main.asm)
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

EXTERN RequestIntegers@0:PROC
EXTERN uint8_mult@0:PROC, Show_mult@0:PROC

; Redefine los símbolos externos por conveniencia
uint8_mult EQU uint8_mult@0
RequestIntegers EQU RequestIntegers@0
Show_mult EQU Show_mult@0

Integers = 2

.data
indicador1 BYTE "Escriba un entero sin signo: ", 0
indicador2 BYTE "Escriba un entero sin signo: ", 0
indicador3 WORD "La suma de los enteros es: ", 0
arreglo WORD Integers DUP(?)
theMult WORD ?

.code
main PROC
call Clrscr
; PedirEnteros( addr indicador1, addr arreglo, Cuenta )
	push Integers
	push OFFSET arreglo
	push OFFSET indicador1
	call RequestIntegers

; PedirEnteros( addr indicador1, addr arreglo, Cuenta )
	push Integers
	push OFFSET arreglo
	push OFFSET indicador2
	call RequestIntegers

; sum = SumaArreglo( addr arreglo, Cuenta )
	push Integers
	push OFFSET arreglo
	call uint8_mult
	mov theMult, eax
; MostrarSuma( addr indicador2, suma )
	push theMult 
	push OFFSET indicador3
	call Show_mult
	call Crlf
exit
main END
END
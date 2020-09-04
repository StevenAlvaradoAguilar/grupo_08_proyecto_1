; Description of the program:
; Author: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Day: 21/06/2020

;Title of the class
TITLE Proyecto_1(main.asm)

;This allows us to know the minimum processor model that accepts the language
.386
.model flat,stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

;We include the libraries links to Irvine so we can call the Irvine procedures
include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib
include Mult.inc ;We include an .inc file that declares a prototype of the function

.data
multiplier BYTE 0
multiplicand BYTE 0

.code
main PROC

	pushad
	;Calls the class RequestIntegers and gives it the data
	INVOKE RequestIntegers

	MOV multiplicand, bl	;
	MOV	multiplier, al		;
	popad
	;Calls the class uint8_mult and gives it the data,
	INVOKE uint8_mult, multiplicand, multiplier

	INVOKE ExitProcess, 0

main ENDP
END main


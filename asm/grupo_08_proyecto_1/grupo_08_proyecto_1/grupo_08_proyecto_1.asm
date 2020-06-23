; Descripcion del Programa:
; Autor: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Dia: 20/06/2020

.386
.model flat, stdcall
.stack 4096

TITLE Proyecto_1(grupo_8_proyecto_1.asm)

include c:\Irvine\Irvine32.inc
ExitProcess PROTO, dwExitCode:DWORD

.data
;Assign the variables
Multiplicand BYTE 24
Multiplier BYTE 3
Result WORD 0
Bit BYTE 0
Index1 BYTE 0
leftShift BYTE 0

.code
main PROC
MOV al, Index1
MOV cl, Multiplier
aumentar_Bit:
	INC al
	MOV bl, Multiplier
	ADD bl, al
	MOV Bit, al
	SHL Bit, -1
	LOOP aumentar_Bit

uint8_mult:
	CMP Bit, 1
	JE Landslide
		MOV al, Multiplicand
		ADD al, Index1
		MOV byte PTR Result, al
		MOV al, byte PTR Result
	Landslide:


 INVOKE ExitProcess,0

main ENDP

; (insertar procesos adicionales aqui)

END main
; Descripcion del Programa:
; Autor: Steven Alvarado Aguilar, Andres Lopéz Sánchez, Fabian Lopéz Sánchez
; Dia: 21/06/2020

TITLE Multiplicand (uint8_mult.asm)
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

.data
;Assign the variables
Multiplicand BYTE 0
Multiplier BYTE 0
Result WORD 0
Bit BYTE 0
Index1 BYTE 0

.code
; Calculate the multiplication of two 8-bit integers.
; Receives: 
; Index
; Multiplier
; Devuelve: EAX = mult
;-----------------------------------------------------
uint8_mult PROC

	mov eax, Index1 ; Indicates the sum of zero
	mov ecx, Multiplier
	cmp ecx, 0 ; ¿The size of the array is <= 0?
	jle L2

L1:
	MOV bl, cl
	SHR bl, 1
	MOV Bit, bl
	INC al
	MOV dl, cl
	SUB dl, 1
	LOOP L1

L2:
	CMP Bit, 1
	MOV bl, Multiplying 
	SHL bx, al
	MOV word PTR Result, bx	
	LEAVE

INVOKE ExitProcess, 0

uint8_mult ENDP

; (Insert addicional procideurs here.)
END

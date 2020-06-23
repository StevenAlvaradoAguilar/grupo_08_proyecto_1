include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib

;seccion 8.6.3 Irvine

RequestInteger PROTO,
	ptrIndicator:PTR BYTE	; Direccion of the Indicator
	Multiplier:BYTE 
	Index1:BYTE 
	
uint8_mult PROTO,
    Multiplicand:BYTE 
	Multiplier:BYTE 
	Result:WORD 
	Bit:BYTE 
	Index1:BYTE 


Show_mult PROTO,
	ptrIndicador:PTR BYTE, ; Indicator of the mesage chain
	theMult:WORD ; Sum of the array
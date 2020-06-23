include c:\Irvine\Irvine32.inc
includelib c:\Irvine\Irvine32.lib
includelib c:\Irvine\Kernel32.lib
includelib c:\Irvine\user32.lib

;seccion 8.6.3 Irvine

RequestInteger PROTO,
	ptrIndicator:PTR BYTE	; dirección del indicador
	Multiplier:BYTE 
	Index1:BYTE 
	
uint8_mult PROTO,
    Multiplicand:BYTE 
	Multiplier:BYTE 
	Result:WORD 
	Bit:BYTE 
	Index1:BYTE 


Show_mult PROTO,
	ptrIndicador:PTR BYTE, ; cadena de mensaje indicador
	theMult:WORD ; suma del arreglo
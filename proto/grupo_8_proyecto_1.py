def uint8_mult(multiplicando,multiplicador):
    indice1=0
    indice2=0
    
    while(multiplicador > 2**indice1):
        indice1=indice1+1
        
    indice1=indice1-1
    shl= 2**indice1
    CorrimientoIzquierda= multiplicador - shl
    CopiaMultiplicando=multiplicando
    multiplicando = multiplicando * shl
    
    while( CorrimientoIzquierda != indice2):
        multiplicando= multiplicando + CopiaMultiplicando
        indice2=indice2+1
        
    resultado = multiplicando    
    print(resultado)  
# DK:
mult_1 = 255
mult_2 = 128  

resultado = uint8_mult(mult_1,mult_2)

# --- REV A: DK ---
# Buenos comentarios y estilo de código
# ESTILO CODE: Ordenado
# COMENTARIOS: No hay
# ALGORITMO    Parece estar cerca de la solución correcta
#			   
# RESULTADOS:  Correctos
#
# Solución prototipado
# 5/5
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
    
uint8_mult(1,4)
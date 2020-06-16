#Programa: De multiplicación de dos números enteros

#Declaración de las variables de 1 byte 8 bits
int8 multiplicando; 
int8 multiplicador;
#Declaramos el resultado de 16 bits ya que, es una multiplicación de 
#8 bits por 8 bits.
int16 resultado;

#Asigna lo que ingresamos por input en las variables.
multiplicando = input( "\n   Introduzca primer numero (entero): " );
multiplicador = input( "\n   Introduzca segundo numero (entero): " );

#Lo que ingresamos a las variables lo multiplicamos y lo guardamos
#en el resultado
resultado = multiplicando * multiplicador;

#Imprimimos en pantalla el resultado
printf("\n\nLa multiplicación es: \n\n");
resultado

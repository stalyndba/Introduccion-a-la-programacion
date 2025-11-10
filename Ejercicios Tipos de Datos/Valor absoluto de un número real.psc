Algoritmo ValorAbsoluto
    Definir numero, absoluto Como Real
    
    Escribir "=== VALOR ABSOLUTO ==="
    Escribir "Ingrese un número real: "
    Leer numero
    
    Si numero < 0 Entonces
        absoluto <- numero * -1
    Sino
        absoluto <- numero
    FinSi
    
    Escribir "El valor absoluto de ", numero, " es: ", absoluto
FinAlgoritmo
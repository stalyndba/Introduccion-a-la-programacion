Algoritmo SumarHastaCero
    Definir numero, suma Como Entero
    
    Escribir "=== SUMAR NÚMEROS HASTA CERO ==="
    suma <- 0
    
    Repetir
        Escribir "Ingrese un número (0 para terminar): "
        Leer numero
        suma <- suma + numero
    Hasta Que numero = 0
    
    Escribir "La suma total es: ", suma
FinAlgoritmo
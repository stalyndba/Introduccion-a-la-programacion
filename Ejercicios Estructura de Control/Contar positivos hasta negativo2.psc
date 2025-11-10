Algoritmo ContarPositivosRepetir
    Definir numero, contador Como Entero
    
    Escribir "=== CONTAR POSITIVOS HASTA NEGATIVO ==="
    contador <- 0
    
    Repetir
        Escribir "Ingrese un número (negativo para terminar): "
        Leer numero
        Si numero >= 0 Entonces
            contador <- contador + 1
        FinSi
    Hasta Que numero < 0
    
    Escribir "Total de números positivos ingresados: ", contador
FinAlgoritmo
Algoritmo ContarPositivosHastaNegativo
    Definir numero, contador Como Entero
    
    Escribir "=== CONTAR POSITIVOS HASTA NEGATIVO ==="
    contador <- 0
    
    Escribir "Ingrese un número: "
    Leer numero
    
    Mientras numero >= 0 Hacer
        contador <- contador + 1
        Escribir "Ingrese otro número (negativo para terminar): "
        Leer numero
    FinMientras
    
    Escribir "Total de números positivos ingresados: ", contador
FinAlgoritmo
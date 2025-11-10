Algoritmo ContarNumerosHastaCero
    Definir numero, contador Como Entero
    
    Escribir "=== CONTAR NÚMEROS HASTA CERO ==="
    contador <- 0
    
    Escribir "Ingrese números (0 para terminar): "
    Leer numero
    
    Mientras numero <> 0 Hacer
        contador <- contador + 1
        Escribir "Ingrese otro número (0 para terminar): "
        Leer numero
    FinMientras
    
    Escribir "Total de números ingresados: ", contador
FinAlgoritmo
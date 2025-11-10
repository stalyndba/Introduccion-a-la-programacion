Algoritmo Factorial
    Definir numero, factorial, i Como Entero
    
    Escribir "=== FACTORIAL DE UN NÚMERO ==="
    Escribir "Ingrese un número: "
    Leer numero
    
    factorial <- 1
    i <- 1
    
    Repetir
        factorial <- factorial * i
        i <- i + 1
    Hasta Que i > numero
    
    Escribir "El factorial de ", numero, " es: ", factorial
FinAlgoritmo
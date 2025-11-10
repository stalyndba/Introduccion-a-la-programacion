Algoritmo SumaHasta100
    Definir numero, suma Como Entero
    
    Escribir "=== SUMA HASTA MAYOR A 100 ==="
    suma <- 0
    
    Mientras suma <= 100 Hacer
        Escribir "Suma actual: ", suma
        Escribir "Ingrese un número: "
        Leer numero
        suma <- suma + numero
    FinMientras
    
    Escribir "Suma total: ", suma, " (mayor a 100)"
FinAlgoritmo
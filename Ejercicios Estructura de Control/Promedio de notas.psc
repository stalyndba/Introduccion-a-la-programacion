Algoritmo PromedioNotas
    Definir nota, suma, contador Como Real
    
    Escribir "=== PROMEDIO DE NOTAS ==="
    suma <- 0
    contador <- 0
    
    Repetir
        Escribir "Ingrese una nota (-1 para terminar): "
        Leer nota
        Si nota <> -1 Entonces
            suma <- suma + nota
            contador <- contador + 1
        FinSi
    Hasta Que nota = -1
    
    Si contador > 0 Entonces
        Escribir "Promedio: ", suma / contador
    Sino
        Escribir "No se ingresaron notas"
    FinSi
FinAlgoritmo
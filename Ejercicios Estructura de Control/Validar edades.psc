Algoritmo ValidarEdades
    Definir edad Como Entero
    
    Escribir "=== VALIDAR EDADES ==="
    Escribir "Ingrese una edad (0-120): "
    Leer edad
    
    Mientras edad >= 0 Y edad <= 120 Hacer
        Escribir "Edad válida: ", edad
        Escribir "Ingrese otra edad (fuera de 0-120 para terminar): "
        Leer edad
    FinMientras
    
    Escribir "Edad fuera del rango válido. Programa terminado."
FinAlgoritmo
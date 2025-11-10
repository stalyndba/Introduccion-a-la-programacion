Algoritmo VocalConsonante
    Definir letra Como Caracter
    
    Escribir "=== VOCAL O CONSONANTE ==="
    Escribir "Ingrese una letra: "
    Leer letra
    
    letra <- Minusculas(letra)
    
    Si letra = 'a' O letra = 'e' O letra = 'i' O letra = 'o' O letra = 'u' Entonces
        Escribir "La letra '", letra, "' es una VOCAL"
    Sino
        Escribir "La letra '", letra, "' es una CONSONANTE"
    FinSi
FinAlgoritmo
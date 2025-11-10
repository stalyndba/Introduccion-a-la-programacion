Algoritmo CalificacionEstudiante
    Definir calificacion Como Caracter
    
    Escribir "=== RENDIMIENTO ESTUDIANTIL ==="
    Escribir "Ingrese la calificación (A, B, C, D, F): "
    Leer calificacion
    
    Segun calificacion Hacer
        'A': Escribir "Excelente rendimiento"
        'B': Escribir "Buen rendimiento"
        'C': Escribir "Rendimiento regular"
        'D': Escribir "Rendimiento deficiente"
        'F': Escribir "Reprobado"
        De Otro Modo: Escribir "Calificación inválida"
    FinSegun
FinAlgoritmo
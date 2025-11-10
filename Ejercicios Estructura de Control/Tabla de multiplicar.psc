Algoritmo TablaMultiplicar
    Definir numero, i, resultado Como Entero
    
    Escribir "=== TABLA DE MULTIPLICAR ==="
    Escribir "Ingrese un número: "
    Leer numero
    
    Escribir "Tabla del ", numero, ":"
    Para i <- 1 Hasta 10 Con Paso 1 Hacer
        resultado <- numero * i
        Escribir numero, " x ", i, " = ", resultado
    FinPara
FinAlgoritmo
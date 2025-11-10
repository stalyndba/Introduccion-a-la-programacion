Algoritmo PromedioTresNumeros
    Definir num1, num2, num3, suma Como Entero
    Definir promedio Como Real
    
    Escribir "Ingrese el primer número: "
    Leer num1
    Escribir "Ingrese el segundo número: "
    Leer num2
    Escribir "Ingrese el tercer número: "
    Leer num3
    
    suma <- num1 + num2 + num3
    promedio <- suma / 3
    
    Escribir "El promedio de ", num1, ", ", num2, " y ", num3, " es: ", promedio
FinAlgoritmo
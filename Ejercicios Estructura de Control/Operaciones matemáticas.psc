Algoritmo OperacionesMatematicas
    Definir num1, num2, resultado Como Real
    Definir operacion Como Caracter
    
    Escribir "=== OPERACIONES MATEMÁTICAS ==="
    Escribir "Ingrese el primer número: "
    Leer num1
    Escribir "Ingrese el segundo número: "
    Leer num2
    Escribir "Ingrese la operación (+, -, *, /): "
    Leer operacion
    
    Segun operacion Hacer
        '+': 
            resultado <- num1 + num2
            Escribir num1, " + ", num2, " = ", resultado
        '-':
            resultado <- num1 - num2
            Escribir num1, " - ", num2, " = ", resultado
        '*':
            resultado <- num1 * num2
            Escribir num1, " * ", num2, " = ", resultado
        '/':
            Si num2 <> 0 Entonces
                resultado <- num1 / num2
                Escribir num1, " / ", num2, " = ", resultado
            Sino
                Escribir "Error: No se puede dividir por cero"
            FinSi
        De Otro Modo: Escribir "Operación inválida"
    FinSegun
FinAlgoritmo
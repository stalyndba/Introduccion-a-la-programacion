Algoritmo ContarPares1al20
    Definir i, contador Como Entero
    
    Escribir "=== CONTAR PARES DEL 1 AL 20 ==="
    contador <- 0
    
    Para i <- 1 Hasta 20 Con Paso 1 Hacer
        Si i MOD 2 = 0 Entonces
            contador <- contador + 1
        FinSi
    FinPara
    
    Escribir "Cantidad de números pares entre 1 y 20: ", contador
FinAlgoritmo
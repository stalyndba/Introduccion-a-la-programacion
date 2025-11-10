Algoritmo PrimeraUltimaLetra
    Definir palabra Como Cadena
    Definir primera, ultima Como Caracter
    
    Escribir "=== PRIMERA Y ÚLTIMA LETRA ==="
    Escribir "Ingrese una palabra: "
    Leer palabra
    
    primera <- SubCadena(palabra, 0, 1)
    ultima <- SubCadena(palabra, Longitud(palabra)-1, 1)
    
    Escribir "Palabra: ", palabra
    Escribir "Primera letra: ", primera
    Escribir "Última letra: ", ultima
FinAlgoritmo
Algoritmo ValidarContrasena
    Definir contrasena Como Cadena
    
    Escribir "=== VALIDAR CONTRASEÑA ==="
    
    Repetir
        Escribir "Ingrese la contraseña: "
        Leer contrasena
        Si contrasena <> "admin123" Entonces
            Escribir "Contraseña incorrecta. Intente nuevamente."
        FinSi
    Hasta Que contrasena = "admin123"
    
    Escribir "¡Contraseña correcta! Acceso concedido."
FinAlgoritmo
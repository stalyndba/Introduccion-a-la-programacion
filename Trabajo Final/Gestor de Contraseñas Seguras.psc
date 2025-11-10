Algoritmo GestorContraseñasSeguras
    // Vectores para almacenar usuarios y contraseñas
    Dimension usuarios[10]
    Dimension contraseñas[10]
    
    Definir numUsuarios, opcion, i Como Entero
    Definir usuario, contraseña Como Caracter
    Definir continuar Como Logico
    
    // Inicialización
    numUsuarios <- 0
    
    // Menú principal
    Repetir
        Escribir "=== GESTOR DE CONTRASEÑAS SEGURAS ==="
        Escribir "1. Registrar usuario"
        Escribir "2. Mostrar usuarios"
        Escribir "3. Verificar fortaleza de contraseñas"
        Escribir "4. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        Limpiar Pantalla
        
        Segun opcion Hacer
            1:
                RegistrarUsuario(usuarios, contraseñas, numUsuarios)
            2:
                MostrarUsuarios(usuarios, contraseñas, numUsuarios)
            3:
                GenerarAlertas(contraseñas, usuarios, numUsuarios)
            4:
                Escribir "Saliendo del gestor..."
            De Otro Modo:
                Escribir "Opción no válida"
        FinSegun
        
        Si opcion <> 4 Entonces
            Escribir ""
            Escribir "Presione Enter para continuar..."
            Esperar Tecla
            Limpiar Pantalla
        FinSi
    Hasta Que opcion = 4
    
FinAlgoritmo

// Función para registrar usuario
SubProceso RegistrarUsuario(usuarios, contraseñas, numUsuarios Por Referencia)
    Definir usuario, contraseña Como Caracter
    Definir contraseñaValida Como Logico
    
    Escribir "=== REGISTRAR USUARIO ==="
    
    Si numUsuarios >= 10 Entonces
        Escribir "Error: No hay espacio para más usuarios"
    FinSi
    
    Escribir "Ingrese nombre de usuario: "
    Leer usuario
    Escribir "Ingrese contraseña: "
    Leer contraseña
    
    // Verificar fortaleza de la contraseña
    contraseñaValida <- VerificarContraseña(contraseña)
    
    Si contraseñaValida Entonces
        numUsuarios <- numUsuarios + 1
        usuarios[numUsuarios] <- usuario
        contraseñas[numUsuarios] <- contraseña
        Escribir "Usuario registrado exitosamente"
    Sino
        Escribir "Contraseña débil. No se pudo registrar el usuario."
        Escribir "La contraseña debe tener al menos:"
        Escribir "- 8 caracteres"
        Escribir "- 1 letra mayúscula"
        Escribir "- 1 letra minúscula" 
        Escribir "- 1 número"
        Escribir "- 1 carácter especial (!@#$%^&*)"
    FinSi
    
FinSubProceso

// Función para verificar fortaleza de contraseña
SubProceso resultado <- VerificarContraseña(contraseña)
    Definir resultado Como Logico
    Definir tieneMayus, tieneMinus, tieneNumero, tieneEspecial Como Logico
    Definir caracter Como Caracter
    definir i como entero
    // Inicializar verificadores
    tieneMayus <- Falso
    tieneMinus <- Falso
    tieneNumero <- Falso
    tieneEspecial <- Falso
    
    // Verificar longitud mínima
    Si Longitud(contraseña) < 8 Entonces
        resultado <- Falso
    FinSi
    
    // Analizar cada carácter
    Para i <- 1 Hasta Longitud(contraseña) Hacer
        caracter <- Subcadena(contraseña, i, i)
        
        Si caracter >= "A" Y caracter <= "Z" Entonces
            tieneMayus <- Verdadero
        Sino 
            Si caracter >= "a" Y caracter <= "z" Entonces
                tieneMinus <- Verdadero
            Sino 
                Si caracter >= "0" Y caracter <= "9" Entonces
                    tieneNumero <- Verdadero
                Sino
                    // Verificar si es carácter especial
                    Si caracter = "!" O caracter = "@" O caracter = "#" O caracter = "$" O caracter = "%" O caracter = "^" O caracter = "&" O caracter = "*" Entonces
                        tieneEspecial <- Verdadero
                    FinSi
                FinSi
            FinSi
        FinSi
    FinPara
    
    // La contraseña es fuerte si cumple todos los requisitos
    resultado <- tieneMayus Y tieneMinus Y tieneNumero Y tieneEspecial
    
FinSubProceso

// Función para mostrar usuarios registrados
SubProceso MostrarUsuarios(usuarios, contraseñas, numUsuarios)
    Definir i Como Entero
    
    Escribir "=== USUARIOS REGISTRADOS ==="
    Escribir ""
    
    Si numUsuarios = 0 Entonces
        Escribir "No hay usuarios registrados"
    FinSi
    
    Escribir "No.  Usuario        Contraseña"
    Escribir "-------------------------------"
    
    Para i <- 1 Hasta numUsuarios Hacer
        Escribir i, ".  ", usuarios[i], "        ", "********"  // No mostrar contraseñas reales
    FinPara
    
    Escribir ""
    Escribir "Total de usuarios: ", numUsuarios
FinSubProceso

// Función para generar alertas de contraseñas débiles
SubProceso GenerarAlertas(contraseñas, usuarios, numUsuarios)
    Definir i, contraseñasDebiles Como Entero
    Definir hayAlertas Como Logico
    
    Escribir "=== ALERTAS DE CONTRASEÑAS DÉBILES ==="
    Escribir ""
    
    hayAlertas <- Falso
    contraseñasDebiles <- 0
    
    Para i <- 1 Hasta numUsuarios Hacer
        Si NO VerificarContraseña(contraseñas[i]) Entonces
            contraseñasDebiles <- contraseñasDebiles + 1
            Si NO hayAlertas Entonces
                Escribir "Contraseñas débiles detectadas:"
                hayAlertas <- Verdadero
            FinSi
            Escribir " - Usuario: ", usuarios[i]
            Escribir "   Contraseña: ", "********"
        FinSi
    FinPara
    
    Si hayAlertas Entonces
        Escribir ""
        Escribir "Total de contraseñas débiles: ", contraseñasDebiles
    Sino
        Escribir "¡Excelente! Todas las contraseñas son seguras."
    FinSi
FinSubProceso
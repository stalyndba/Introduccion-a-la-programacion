Algoritmo ControlAccesosWiFi
    // Vectores para dispositivos autorizados
    Dimension dispositivos[10]
    Dimension macs[10]
    Dimension ips[10]
    Dimension conexionesActivas[10]
    
    Definir numDispositivos, opcion Como Entero
    Definir limiteConexiones Como Entero
    
    // Inicialización
    numDispositivos <- 0
    limiteConexiones <- 3  // Límite de conexiones simultáneas
    
    // Menú principal
    Repetir
        Escribir "=== CONTROL DE ACCESOS WiFi ==="
        Escribir "1. Registrar dispositivo"
        Escribir "2. Intentar conexión"
        Escribir "3. Mostrar dispositivos"
        Escribir "4. Generar alertas"
        Escribir "5. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        Limpiar Pantalla
        
        Segun opcion Hacer
            1:
                RegistrarDispositivo(dispositivos, macs, ips, conexionesActivas, numDispositivos)
            2:
                ValidarAcceso(dispositivos, macs, ips, conexionesActivas, numDispositivos, limiteConexiones)
            3:
                MostrarDispositivos(dispositivos, macs, ips, conexionesActivas, numDispositivos)
            4:
                GenerarAlertas(dispositivos, macs, ips, conexionesActivas, numDispositivos, limiteConexiones)
            5:
                Escribir "Saliendo del sistema..."
            De Otro Modo:
                Escribir "Opción no válida"
        FinSegun
        
        Si opcion <> 5 Entonces
            Escribir ""
            Escribir "Presione Enter para continuar..."
            Esperar Tecla
            Limpiar Pantalla
        FinSi
    Hasta Que opcion = 5
    
FinAlgoritmo

// Función para registrar dispositivo autorizado
SubProceso RegistrarDispositivo(dispositivos, macs, ips, conexionesActivas, numDispositivos Por Referencia)
    Definir dispositivo, mac, ip Como Caracter
    
    Escribir "=== REGISTRAR DISPOSITIVO AUTORIZADO ==="
    
    Si numDispositivos >= 10 Entonces
        Escribir "Error: No hay espacio para más dispositivos"
    FinSi
    
    Escribir "Ingrese nombre del dispositivo: "
    Leer dispositivo
    Escribir "Ingrese dirección MAC: "
    Leer mac
    Escribir "Ingrese dirección IP: "
    Leer ip
    
    numDispositivos <- numDispositivos + 1
    dispositivos[numDispositivos] <- dispositivo
    macs[numDispositivos] <- mac
    ips[numDispositivos] <- ip
    conexionesActivas[numDispositivos] <- 0
    
    Escribir "Dispositivo autorizado registrado exitosamente"
FinSubProceso

// Función para validar acceso
SubProceso ValidarAcceso(dispositivos, macs, ips, conexionesActivas, numDispositivos, limiteConexiones)
    Definir mac, ip Como Caracter
    Definir i, dispositivoEncontrado Como Entero
    Definir autorizado Como Logico
    
    Escribir "=== VALIDAR ACCESO WiFi ==="
    
    Si numDispositivos = 0 Entonces
        Escribir "No hay dispositivos autorizados registrados"
    FinSi
    
    Escribir "Ingrese dirección MAC del dispositivo: "
    Leer mac
    Escribir "Ingrese dirección IP: "
    Leer ip
    
    // Buscar dispositivo en lista autorizada
    autorizado <- Falso
    dispositivoEncontrado <- 0
    
    Para i <- 1 Hasta numDispositivos Hacer
        Si macs[i] = mac Entonces
            autorizado <- Verdadero
            dispositivoEncontrado <- i
        FinSi
    FinPara
    
    Si autorizado Entonces
        // Verificar límite de conexiones
        Si conexionesActivas[dispositivoEncontrado] < limiteConexiones Entonces
            conexionesActivas[dispositivoEncontrado] <- conexionesActivas[dispositivoEncontrado] + 1
            Escribir "ACCESO PERMITIDO - Dispositivo: ", dispositivos[dispositivoEncontrado]
            Escribir "Conexiones activas: ", conexionesActivas[dispositivoEncontrado], "/", limiteConexiones
        Sino
            Escribir "ACCESO DENEGADO - Límite de conexiones alcanzado"
            Escribir "Dispositivo: ", dispositivos[dispositivoEncontrado]
            Escribir "Conexiones activas: ", conexionesActivas[dispositivoEncontrado], "/", limiteConexiones
        FinSi
    Sino
        Escribir "ACCESO DENEGADO - Dispositivo no autorizado"
        Escribir "MAC: ", mac, " - IP: ", ip
    FinSi
FinSubProceso

// Función para mostrar dispositivos
SubProceso MostrarDispositivos(dispositivos, macs, ips, conexionesActivas, numDispositivos)
    Definir i Como Entero
    
    Escribir "=== DISPOSITIVOS AUTORIZADOS ==="
    Escribir ""
    
    Si numDispositivos = 0 Entonces
        Escribir "No hay dispositivos registrados"
    FinSi
    
    Escribir "No.  Dispositivo      MAC            IP          Conexiones"
    Escribir "-----------------------------------------------------------"
    
    Para i <- 1 Hasta numDispositivos Hacer
        Escribir i, ".  ", dispositivos[i], "    ", macs[i], "    ", ips[i], "    ", conexionesActivas[i]
    FinPara
    
    Escribir ""
    Escribir "Total de dispositivos autorizados: ", numDispositivos
FinSubProceso

// Función para generar alertas
SubProceso GenerarAlertas(dispositivos, macs, ips, conexionesActivas, numDispositivos, limiteConexiones)
    Definir i, alertas, intentosNoAutorizados Como Entero
    Definir hayProblemas Como Logico
    
    Escribir "=== ALERTAS DE SEGURIDAD ==="
    Escribir ""
    
    hayProblemas <- Falso
    alertas <- 0
    intentosNoAutorizados <- 0
    
    // Simular algunos intentos no autorizados
    intentosNoAutorizados <- azar(5)
    
    // Alertas por límite de conexiones
    Para i <- 1 Hasta numDispositivos Hacer
        Si conexionesActivas[i] >= limiteConexiones Entonces
            alertas <- alertas + 1
            Si NO hayProblemas Entonces
                Escribir "DISPOSITIVOS CON LÍMITE DE CONEXIONES:"
                hayProblemas <- Verdadero
            FinSi
            Escribir " - ", dispositivos[i], " tiene ", conexionesActivas[i], " conexiones activas"
        FinSi
    FinPara
    
    // Alerta por intentos no autorizados
    Si intentosNoAutorizados > 0 Entonces
        alertas <- alertas + 1
        Si NO hayProblemas Entonces
            Escribir "INTENTOS DE ACCESO NO AUTORIZADOS:"
            hayProblemas <- Verdadero
        FinSi
        Escribir " - Se detectaron ", intentosNoAutorizados, " intentos de acceso no autorizados"
    FinSi
    
    Si hayProblemas Entonces
        Escribir ""
        Escribir "Total de alertas generadas: ", alertas
    Sino
        Escribir "No se detectaron problemas de seguridad"
    FinSi
    
    // Mostrar estadísticas
    Escribir ""
    Escribir "=== ESTADÍSTICAS ==="
    Escribir "Dispositivos autorizados: ", numDispositivos
    Escribir "Límite de conexiones por dispositivo: ", limiteConexiones
    Escribir "Intentos no autorizados simulados: ", intentosNoAutorizados
FinSubProceso
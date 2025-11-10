Algoritmo SistemaMonitoreoAccesos
    // Definición de variables globales
    Definir usuarios, servidores Como Cadena
    Definir intentos, horas, tipos_acceso Como Entero
    Definir ips Como Cadena
    Definir num_usuarios, num_servidores, total_intentos Como Entero
    Definir max_intentos, max_servidores Como Entero
    
    // Inicialización de tamaños máximos
    max_intentos <- 100
    max_servidores <- 10
    max_usuarios <- 20
    
    // Inicialización de vectores y matrices
    Dimension usuarios[max_usuarios]
    Dimension servidores[max_servidores]
    Dimension intentos[max_intentos, 4]  // [usuario_idx, servidor_idx, tipo, hora]
    Dimension ips[max_intentos]
    Dimension tipos_acceso[5]
    
    // Inicialización del sistema
    InicializarSistema(usuarios, servidores, tipos_acceso, num_usuarios, num_servidores)
    total_intentos <- 0
    
    // Menú principal
    EjecutarMenuPrincipal(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos, max_intentos)
FinAlgoritmo

// Función para inicializar el sistema con datos de prueba
SubProceso InicializarSistema(usuarios, servidores, tipos_acceso, num_usuarios Por Referencia, num_servidores Por Referencia)
    // Usuarios del sistema
    usuarios[0] <- "admin"
    usuarios[1] <- "usuario1"
    usuarios[2] <- "usuario2"
    usuarios[3] <- "invitado"
    usuarios[4] <- "auditor"
    num_usuarios <- 5
    
    // Servidores disponibles
    servidores[0] <- "SRV-DB-01"
    servidores[1] <- "SRV-WEB-01"
    servidores[2] <- "SRV-FILE-01"
    servidores[3] <- "SRV-BACKUP-01"
    servidores[4] <- "SRV-ADMIN-01"
    num_servidores <- 5
    
    // Tipos de acceso
    tipos_acceso[0] <- "Login exitoso"
    tipos_acceso[1] <- "Login fallido"
    tipos_acceso[2] <- "Acceso denegado"
    tipos_acceso[3] <- "Intento sospechoso"
    tipos_acceso[4] <- "Cambio de contraseña"
    
    Escribir "Sistema de Monitoreo de Accesos Inicializado"
    Escribir "Usuarios registrados: ", num_usuarios
    Escribir "Servidores monitoreados: ", num_servidores
    Escribir ""
FinSubProceso

// Menú principal del sistema
SubProceso EjecutarMenuPrincipal(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos Por Referencia, max_intentos)
    Definir opcion Como Entero
    Definir salir Como Logico
    salir <- Falso
    
    Repetir
        Escribir "=== SISTEMA DE MONITOREO DE ACCESOS ==="
        Escribir "1. Registrar intento de acceso"
        Escribir "2. Mostrar reporte de accesos"
        Escribir "3. Generar alertas de seguridad"
        Escribir "4. Buscar intentos por usuario"
        Escribir "5. Buscar intentos por servidor"
        Escribir "6. Estadísticas del sistema"
        Escribir "7. Simular actividad del sistema"
        Escribir "8. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        
        Segun opcion Hacer
            1:
                RegistrarIntento(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos, max_intentos)
            2:
                MostrarReporte(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
            3:
                GenerarAlertas(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
            4:
                BuscarPorUsuario(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
            5:
                BuscarPorServidor(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
            6:
                MostrarEstadisticas(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
            7:
                SimularActividad(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos, max_intentos)
            8:
                salir <- Verdadero
                Escribir "Saliendo del sistema..."
            De Otro Modo:
                Escribir "Opción no válida. Intente nuevamente."
        FinSegun
        Escribir ""
        Escribir "Presione una tecla para continuar..."
        Esperar Tecla
        Limpiar Pantalla
    Hasta Que salir
FinSubProceso

// Función para registrar un intento de acceso
SubProceso RegistrarIntento(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos Por Referencia, max_intentos)
    Definir usuario_idx, servidor_idx, tipo_idx, hora, i Como Entero
    Definir ip Como Cadena
    
    Si total_intentos >= max_intentos Entonces
        Escribir "ERROR: Límite de intentos registrados alcanzado."
        Escribir "No se pueden registrar más intentos."
        Retornar
    FinSi
    
    Escribir "=== REGISTRAR INTENTO DE ACCESO ==="
    
    // Seleccionar usuario
    Escribir "Usuarios disponibles:"
    Para i <- 0 Hasta num_usuarios - 1 Hacer
        Escribir i, ": ", usuarios[i]
    FinPara
    Escribir "Seleccione el índice del usuario: "
    Leer usuario_idx
    
    Si usuario_idx < 0 O usuario_idx >= num_usuarios Entonces
        Escribir "ERROR: Índice de usuario no válido."
        Retornar
    FinSi
    
    // Seleccionar servidor
    Escribir "Servidores disponibles:"
    Para i <- 0 Hasta num_servidores - 1 Hacer
        Escribir i, ": ", servidores[i]
    FinPara
    Escribir "Seleccione el índice del servidor: "
    Leer servidor_idx
    
    Si servidor_idx < 0 O servidor_idx >= num_servidores Entonces
        Escribir "ERROR: Índice de servidor no válido."
        Retornar
    FinSi
    
    // Seleccionar tipo de acceso
    Escribir "Tipos de acceso:"
    Para i <- 0 Hasta 4 Hacer
        Escribir i, ": ", tipos_acceso[i]
    FinPara
    Escribir "Seleccione el tipo de acceso: "
    Leer tipo_idx
    
    Si tipo_idx < 0 O tipo_idx > 4 Entonces
        Escribir "ERROR: Tipo de acceso no válido."
        Retornar
    FinSi
    
    // Ingresar hora y IP
    Escribir "Ingrese la hora (0-23): "
    Leer hora
    Escribir "Ingrese la dirección IP: "
    Leer ip
    
    // Registrar el intento
    intentos[total_intentos, 0] <- usuario_idx
    intentos[total_intentos, 1] <- servidor_idx
    intentos[total_intentos, 2] <- tipo_idx
    intentos[total_intentos, 3] <- hora
    ips[total_intentos] <- ip
    total_intentos <- total_intentos + 1
    
    Escribir "Intento de acceso registrado exitosamente."
    Escribir "Total de intentos registrados: ", total_intentos
FinSubProceso

// Función para mostrar reporte completo
SubProceso MostrarReporte(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
    Definir i, usuario_idx, servidor_idx, tipo_idx, hora Como Entero
    
    Escribir "=== REPORTE COMPLETO DE ACCESOS ==="
    Escribir "Total de intentos registrados: ", total_intentos
    Escribir ""
    
    Si total_intentos = 0 Entonces
        Escribir "No hay intentos de acceso registrados."
        Retornar
    FinSi
    
    Escribir "No. | Usuario        | Servidor       | Tipo de Acceso       | Hora | IP"
    Escribir "----|----------------|----------------|----------------------|------|----------------"
    
    Para i <- 0 Hasta total_intentos - 1 Hacer
        usuario_idx <- intentos[i, 0]
        servidor_idx <- intentos[i, 1]
        tipo_idx <- intentos[i, 2]
        hora <- intentos[i, 3]
        
        Escribir i, " | ", usuarios[usuario_idx], " | ", servidores[servidor_idx], " | ", tipos_acceso[tipo_idx], " | ", hora, " | ", ips[i]
    FinPara
FinSubProceso

// Función para generar alertas de seguridad
SubProceso GenerarAlertas(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
    Definir i, j, usuario_idx, servidor_idx, tipo_idx, hora, contador Como Entero
    Definir alertas_generadas Como Logico
    alertas_generadas <- Falso
    
    Escribir "=== ALERTAS DE SEGURIDAD ==="
    
    Si total_intentos = 0 Entonces
        Escribir "No hay intentos de acceso para analizar."
        Retornar
    FinSi
    
    // Alertas por múltiples intentos fallidos
    Para usuario_idx <- 0 Hasta num_usuarios - 1 Hacer
        contador <- 0
        Para i <- 0 Hasta total_intentos - 1 Hacer
            Si intentos[i, 0] = usuario_idx Y intentos[i, 2] = 1 Entonces  // Login fallido
                contador <- contador + 1
            FinSi
        FinPara
        
        Si contador >= 3 Entonces
            Escribir "ALERTA: Usuario '", usuarios[usuario_idx], "' tiene ", contador, " intentos fallidos consecutivos"
            alertas_generadas <- Verdadero
        FinSi
    FinPara
    
    // Alertas por accesos en horas no laborales
    Para i <- 0 Hasta total_intentos - 1 Hacer
        hora <- intentos[i, 3]
        Si (hora >= 0 Y hora <= 5) O hora >= 22 Entonces
            usuario_idx <- intentos[i, 0]
            servidor_idx <- intentos[i, 1]
            Escribir "ALERTA: Acceso nocturno detectado - Usuario: ", usuarios[usuario_idx], ", Servidor: ", servidores[servidor_idx], ", Hora: ", hora
            alertas_generadas <- Verdadero
        FinSi
    FinPara
    
    // Alertas por intentos sospechosos
    Para i <- 0 Hasta total_intentos - 1 Hacer
        tipo_idx <- intentos[i, 2]
        Si tipo_idx = 3 Entonces  // Intento sospechoso
            usuario_idx <- intentos[i, 0]
            servidor_idx <- intentos[i, 1]
            Escribir "ALERTA: Intento sospechoso detectado - Usuario: ", usuarios[usuario_idx], ", Servidor: ", servidores[servidor_idx], ", IP: ", ips[i]
            alertas_generadas <- Verdadero
        FinSi
    FinPara
    
    Si NO alertas_generadas Entonces
        Escribir "No se generaron alertas de seguridad."
    FinSi
FinSubProceso

// Función para buscar intentos por usuario
SubProceso BuscarPorUsuario(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
    Definir usuario_idx, i, usuario_actual, servidor_idx, tipo_idx, hora Como Entero
    
    Escribir "=== BUSCAR INTENTOS POR USUARIO ==="
    Escribir "Usuarios disponibles:"
    Para i <- 0 Hasta num_usuarios - 1 Hacer
        Escribir i, ": ", usuarios[i]
    FinPara
    Escribir "Seleccione el índice del usuario: "
    Leer usuario_idx
    
    Si usuario_idx < 0 O usuario_idx >= num_usuarios Entonces
        Escribir "ERROR: Índice de usuario no válido."
        Retornar
    FinSi
    
    Escribir "Intento | Servidor       | Tipo de Acceso       | Hora | IP"
    Escribir "--------|----------------|----------------------|------|----------------"
    
    Para i <- 0 Hasta total_intentos - 1 Hacer
        Si intentos[i, 0] = usuario_idx Entonces
            servidor_idx <- intentos[i, 1]
            tipo_idx <- intentos[i, 2]
            hora <- intentos[i, 3]
            
            Escribir i, " | ", servidores[servidor_idx], " | ", tipos_acceso[tipo_idx], " | ", hora, " | ", ips[i]
        FinSi
    FinPara
FinSubProceso

// Función para buscar intentos por servidor
SubProceso BuscarPorServidor(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
    Definir servidor_idx, i, usuario_idx, tipo_idx, hora Como Entero
    
    Escribir "=== BUSCAR INTENTOS POR SERVIDOR ==="
    Escribir "Servidores disponibles:"
    Para i <- 0 Hasta num_servidores - 1 Hacer
        Escribir i, ": ", servidores[i]
    FinPara
    Escribir "Seleccione el índice del servidor: "
    Leer servidor_idx
    
    Si servidor_idx < 0 O servidor_idx >= num_servidores Entonces
        Escribir "ERROR: Índice de servidor no válido."
        Retornar
    FinSi
    
    Escribir "Intento | Usuario        | Tipo de Acceso       | Hora | IP"
    Escribir "--------|----------------|----------------------|------|----------------"
    
    Para i <- 0 Hasta total_intentos - 1 Hacer
        Si intentos[i, 1] = servidor_idx Entonces
            usuario_idx <- intentos[i, 0]
            tipo_idx <- intentos[i, 2]
            hora <- intentos[i, 3]
            
            Escribir i, " | ", usuarios[usuario_idx], " | ", tipos_acceso[tipo_idx], " | ", hora, " | ", ips[i]
        FinSi
    FinPara
FinSubProceso

// Función para mostrar estadísticas del sistema
SubProceso MostrarEstadisticas(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos)
    Definir i, j, contador Como Entero
    Definir estadisticas_tipos[5]
    
    Escribir "=== ESTADÍSTICAS DEL SISTEMA ==="
    Escribir "Total de intentos registrados: ", total_intentos
    Escribir "Total de usuarios: ", num_usuarios
    Escribir "Total de servidores: ", num_servidores
    Escribir ""
    
    // Estadísticas por tipo de acceso
    Escribir "ESTADÍSTICAS POR TIPO DE ACCESO:"
    Para i <- 0 Hasta 4 Hacer
        contador <- 0
        Para j <- 0 Hasta total_intentos - 1 Hacer
            Si intentos[j, 2] = i Entonces
                contador <- contador + 1
            FinSi
        FinPara
        Escribir tipos_acceso[i], ": ", contador, " intentos (", (contador * 100 / total_intentos), "%)"
    FinPara
    
    Escribir ""
    
    // Usuarios más activos
    Escribir "USUARIOS MÁS ACTIVOS:"
    Para i <- 0 Hasta num_usuarios - 1 Hacer
        contador <- 0
        Para j <- 0 Hasta total_intentos - 1 Hacer
            Si intentos[j, 0] = i Entonces
                contador <- contador + 1
            FinSi
        FinPara
        Escribir usuarios[i], ": ", contador, " intentos"
    FinPara
    
    Escribir ""
    
    // Servidores más accedidos
    Escribir "SERVIDORES MÁS ACCEDIDOS:"
    Para i <- 0 Hasta num_servidores - 1 Hacer
        contador <- 0
        Para j <- 0 Hasta total_intentos - 1 Hacer
            Si intentos[j, 1] = i Entonces
                contador <- contador + 1
            FinSi
        FinPara
        Escribir servidores[i], ": ", contador, " accesos"
    FinPara
FinSubProceso

// Función para simular actividad del sistema
SubProceso SimularActividad(usuarios, servidores, intentos, ips, tipos_acceso, num_usuarios, num_servidores, total_intentos Por Referencia, max_intentos)
    Definir i, num_simulaciones, usuario_idx, servidor_idx, tipo_idx, hora Como Entero
    Definir ips_simuladas[5] Como Cadena
    
    Escribir "=== SIMULACIÓN DE ACTIVIDAD ==="
    Escribir "Ingrese cuántos intentos desea simular: "
    Leer num_simulaciones
    
    // IPs de prueba
    ips_simuladas[0] <- "192.168.1.100"
    ips_simuladas[1] <- "10.0.0.50"
    ips_simuladas[2] <- "172.16.0.25"
    ips_simuladas[3] <- "192.168.2.75"
    ips_simuladas[4] <- "10.1.1.100"
    
    Para i <- 1 Hasta num_simulaciones Hacer
        Si total_intentos >= max_intentos Entonces
            Escribir "Límite máximo de intentos alcanzado. No se pueden simular más."
            Retornar
        FinSi
        
        usuario_idx <- Aleatorio(0, num_usuarios - 1)
        servidor_idx <- Aleatorio(0, num_servidores - 1)
        tipo_idx <- Aleatorio(0, 4)
        hora <- Aleatorio(0, 23)
        
        intentos[total_intentos, 0] <- usuario_idx
        intentos[total_intentos, 1] <- servidor_idx
        intentos[total_intentos, 2] <- tipo_idx
        intentos[total_intentos, 3] <- hora
        ips[total_intentos] <- ips_simuladas[Aleatorio(0, 4)]
        total_intentos <- total_intentos + 1
        
        Escribir "Simulado: ", usuarios[usuario_idx], " -> ", servidores[servidor_idx], " (", tipos_acceso[tipo_idx], ")"
    FinPara
    
    Escribir "Simulación completada. Total de intentos: ", total_intentos
FinSubProceso
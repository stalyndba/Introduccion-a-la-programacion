Algoritmo SistemaInventarioRed
    // Vectores y matrices para el inventario
    Dimension equipos[10]
    Dimension ubicaciones[10]
    Dimension ips[10]
    Dimension tipos[10]
    Dimension estados[10]
    
    Definir numEquipos, opcion Como Entero
    
    // Inicialización
    numEquipos <- 0
    
    // Menú principal
    Repetir
        Escribir "=== SISTEMA DE INVENTARIO DE RED ==="
        Escribir "1. Registrar equipo"
        Escribir "2. Mostrar inventario"
        Escribir "3. Generar alertas"
        Escribir "4. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        Limpiar Pantalla
        
        Segun opcion Hacer
            1:
                RegistrarEquipo(equipos, ubicaciones, ips, tipos, estados, numEquipos)
            2:
                MostrarInventario(equipos, ubicaciones, ips, tipos, estados, numEquipos)
            3:
                GenerarAlertas(equipos, ubicaciones, ips, tipos, estados, numEquipos)
            4:
                Escribir "Saliendo del sistema..."
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

// Función para registrar equipo
SubProceso RegistrarEquipo(equipos, ubicaciones, ips, tipos, estados, numEquipos Por Referencia)
    Definir equipo, ubicacion, ip, tipo, estado Como Caracter
    
    Escribir "=== REGISTRAR EQUIPO ==="
    
    Si numEquipos >= 10 Entonces
        Escribir "Error: No hay espacio para más equipos"
    FinSi
    
    Escribir "Ingrese nombre del equipo: "
    Leer equipo
    Escribir "Ingrese ubicación: "
    Leer ubicacion
    Escribir "Ingrese dirección IP: "
    Leer ip
    Escribir "Ingrese tipo (router/switch/servidor): "
    Leer tipo
    Escribir "Ingrese estado (activo/inactivo/mantenimiento): "
    Leer estado
    
    numEquipos <- numEquipos + 1
    equipos[numEquipos] <- equipo
    ubicaciones[numEquipos] <- ubicacion
    ips[numEquipos] <- ip
    tipos[numEquipos] <- tipo
    estados[numEquipos] <- estado
    
    Escribir "Equipo registrado exitosamente"
FinSubProceso

// Función para mostrar inventario
SubProceso MostrarInventario(equipos, ubicaciones, ips, tipos, estados, numEquipos)
    Definir i Como Entero
    
    Escribir "=== INVENTARIO DE EQUIPOS DE RED ==="
    Escribir ""
    
    Si numEquipos = 0 Entonces
        Escribir "No hay equipos registrados"
    FinSi
    
    Escribir "No.  Equipo          IP            Tipo        Ubicación       Estado"
    Escribir "----------------------------------------------------------------------"
    
    Para i <- 1 Hasta numEquipos Hacer
        Escribir i, ".  ", equipos[i], "    ", ips[i], "    ", tipos[i], "    ", ubicaciones[i], "    ", estados[i]
    FinPara
    
    Escribir ""
    Escribir "Total de equipos: ", numEquipos
    
    // Mostrar resumen por estado
    Escribir ""
    Escribir "RESUMEN POR ESTADO:"
    Escribir "Activos: ", ContarPorEstado(estados, numEquipos, "activo")
    Escribir "Inactivos: ", ContarPorEstado(estados, numEquipos, "inactivo")
    Escribir "En mantenimiento: ", ContarPorEstado(estados, numEquipos, "mantenimiento")
FinSubProceso

// Función para contar equipos por estado
SubProceso total <- ContarPorEstado(estados, numEquipos, estadoBuscado)
    Definir total, i Como Entero
    
    total <- 0
    Para i <- 1 Hasta numEquipos Hacer
        Si Minusculas(estados[i]) = Minusculas(estadoBuscado) Entonces
            total <- total + 1
        FinSi
    FinPara
FinSubProceso

// Función para generar alertas
SubProceso GenerarAlertas(equipos, ubicaciones, ips, tipos, estados, numEquipos)
    Definir i, alertas Como Entero
    Definir hayProblemas Como Logico
    
    Escribir "=== ALERTAS DEL SISTEMA ==="
    Escribir ""
    
    hayProblemas <- Falso
    alertas <- 0
    
    Para i <- 1 Hasta numEquipos Hacer
        // Alerta por equipos inactivos
        Si estados[i] = "inactivo" Entonces
            alertas <- alertas + 1
            Si NO hayProblemas Entonces
                Escribir "EQUIPOS INACTIVOS DETECTADOS:"
                hayProblemas <- Verdadero
            FinSi
            Escribir " - ", equipos[i], " (", ips[i], ") en ", ubicaciones[i]
        FinSi
        
        // Alerta por IP inválida (verificación básica)
        Si Longitud(ips[i]) < 7 Entonces  // IP muy corta
            alertas <- alertas + 1
            Si NO hayProblemas Entonces
                Escribir "IPS INVÁLIDAS DETECTADAS:"
                hayProblemas <- Verdadero
            FinSi
            Escribir " - ", equipos[i], " tiene IP inválida: ", ips[i]
        FinSi
    FinPara
    
    Si hayProblemas Entonces
        Escribir ""
        Escribir "Total de alertas: ", alertas
    Sino
        Escribir "No se detectaron problemas en el inventario"
    FinSi
    
    // Mostrar disponibilidad general
    Escribir ""
    Escribir "DISPONIBILIDAD GENERAL:"
    Escribir "Equipos activos: ", ContarPorEstado(estados, numEquipos, "activo"), " de ", numEquipos
    Si numEquipos > 0 Entonces
        Escribir "Tasa de disponibilidad: ", (ContarPorEstado(estados, numEquipos, "activo") / numEquipos) * 100, "%"
    FinSi
FinSubProceso
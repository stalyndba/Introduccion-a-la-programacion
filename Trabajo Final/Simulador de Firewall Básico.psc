Algoritmo SimuladorFirewall
    // Definición de variables
    Dimension IPsBloqueadas[10]
    Dimension paquetes[20, 4]  // [IP, Puerto, Protocolo, Estado]
    
    Definir numIPsBloqueadas, numPaquetes, opcion Como Entero
    
    // Inicialización
    numIPsBloqueadas <- 0
    numPaquetes <- 0
    
    // Menú principal
    Repetir
        Escribir "=== SIMULADOR DE FIREWALL ==="
        Escribir "1. Registrar paquete entrante"
        Escribir "2. Mostrar registros de paquetes"
        Escribir "3. Agregar IP a lista bloqueada"
        Escribir "4. Mostrar IPs bloqueadas"
        Escribir "5. Generar alertas"
        Escribir "6. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        Limpiar Pantalla
        
        Segun opcion Hacer
            1:
                RegistrarPaquete(IPsBloqueadas, paquetes, numIPsBloqueadas, numPaquetes)
            2:
                MostrarRegistros(paquetes, numPaquetes)
            3:
                AgregarIPBloqueada(IPsBloqueadas, numIPsBloqueadas)
            4:
                MostrarIPsBloqueadas(IPsBloqueadas, numIPsBloqueadas)
            5:
                GenerarAlertas(paquetes, numPaquetes)
            6:
                Escribir "Saliendo del firewall..."
            De Otro Modo:
                Escribir "Opción no válida"
        FinSegun
        
        Si opcion <> 6 Entonces
            Escribir ""
            Escribir "Presione Enter para continuar..."
            Esperar Tecla
            Limpiar Pantalla
        FinSi
    Hasta Que opcion = 6
    
FinAlgoritmo

// Función para registrar paquetes entrantes
SubProceso RegistrarPaquete(IPsBloqueadas, paquetes, numIPsBloqueadas, numPaquetes Por Referencia)
    Definir ip, protocolo Como Caracter
    Definir puerto, i Como Entero
    Definir bloqueada Como Logico
    
    Escribir "=== REGISTRAR PAQUETE ENTRANTE ==="
    
    Si numPaquetes >= 20 Entonces
        Escribir "Error: No hay espacio para más paquetes"
    FinSi
    
    Escribir "Ingrese IP de origen: "
    Leer ip
    Escribir "Ingrese puerto: "
    Leer puerto
    Escribir "Ingrese protocolo (TCP/UDP/ICMP): "
    Leer protocolo
    
    // Verificar si la IP está bloqueada
    bloqueada <- Falso
    Para i <- 1 Hasta numIPsBloqueadas Hacer
        Si IPsBloqueadas[i+1] = ip Entonces
            bloqueada <- Verdadero
        FinSi
    FinPara
    
    // Registrar el paquete (empezar desde índice 1)
    numPaquetes <- numPaquetes + 1
    paquetes[numPaquetes, 1] <- ip
    paquetes[numPaquetes, 2] <- ConvertirATexto(puerto)
    paquetes[numPaquetes, 3] <- protocolo
    
    Si bloqueada Entonces
        paquetes[numPaquetes, 4] <- "BLOQUEADO"
        Escribir "¡PAQUETE BLOQUEADO! IP en lista negra"
    Sino
        paquetes[numPaquetes, 4] <- "PERMITIDO"
        Escribir "Paquete permitido"
    FinSi
    
FinSubProceso

// Función para mostrar registros de paquetes
SubProceso MostrarRegistros(paquetes, numPaquetes)
    Definir i Como Entero
    
    Escribir "=== REGISTROS DE PAQUETES ==="
    Escribir ""
    
    Si numPaquetes = 0 Entonces
        Escribir "No hay paquetes registrados"
    FinSi
    
    Escribir "No.  IP Origen       Puerto  Protocolo  Estado"
    Escribir "------------------------------------------------"
    
    Para i <- 1 Hasta numPaquetes Hacer
        Escribir i, ".  ", paquetes[i,1], "    ", paquetes[i,2], "    ", paquetes[i,3], "    ", paquetes[i,4]
    FinPara
    
    Escribir ""
    Escribir "Total de paquetes: ", numPaquetes
FinSubProceso

// Función para agregar IP a lista bloqueada
SubProceso AgregarIPBloqueada(IPsBloqueadas, numIPsBloqueadas Por Referencia)
    Definir ip Como Caracter
    
    Escribir "=== AGREGAR IP BLOQUEADA ==="
    
    Si numIPsBloqueadas >= 10 Entonces
        Escribir "Error: Lista de IPs bloqueadas llena"
    FinSi
    
    Escribir "Ingrese IP a bloquear: "
    Leer ip
    
    numIPsBloqueadas <- numIPsBloqueadas + 1
    IPsBloqueadas[numIPsBloqueadas] <- ip
    
    Escribir "IP ", ip, " agregada a lista bloqueada"
FinSubProceso

// Función para mostrar IPs bloqueadas
SubProceso MostrarIPsBloqueadas(IPsBloqueadas, numIPsBloqueadas)
    Definir i Como Entero
    
    Escribir "=== IPs BLOQUEADAS ==="
    Escribir ""
    
    Si numIPsBloqueadas = 0 Entonces
        Escribir "No hay IPs bloqueadas"
    FinSi
    
    Para i <- 1 Hasta numIPsBloqueadas Hacer
        Escribir i, ". ", IPsBloqueadas[i]
    FinPara
    
    Escribir ""
    Escribir "Total de IPs bloqueadas: ", numIPsBloqueadas
FinSubProceso

// Función para generar alertas
SubProceso GenerarAlertas(paquetes, numPaquetes)
    Definir i, paquetesBloqueados Como Entero
    Definir hayAlertas Como Logico
    
    Escribir "=== ALERTAS DE SEGURIDAD ==="
    Escribir ""
    
    hayAlertas <- Falso
    paquetesBloqueados <- 0
    
    // Contar paquetes bloqueados
    Para i <- 1 Hasta numPaquetes Hacer
        Si paquetes[i,4] = "BLOQUEADO" Entonces
            paquetesBloqueados <- paquetesBloqueados + 1
            Si NO hayAlertas Entonces
                Escribir "Paquetes bloqueados detectados:"
                hayAlertas <- Verdadero
            FinSi
            Escribir " - IP: ", paquetes[i,1], " | Puerto: ", paquetes[i,2], " | Protocolo: ", paquetes[i,3]
        FinSi
    FinPara
    
    Si hayAlertas Entonces
        Escribir ""
        Escribir "Total de paquetes bloqueados: ", paquetesBloqueados
    Sino
        Escribir "No se detectaron alertas de seguridad"
    FinSi
FinSubProceso
Algoritmo EscaneoVulnerabilidades
    // Vectores y matrices para el escaneo
    Dimension hosts[10]
    Dimension servicios[10, 5]    // 5 servicios por host
    Dimension intentos[10, 5]     // Intentos por servicio
    Dimension vulnerabilidades[10, 5] // Vulnerabilidades por servicio
    
    Definir numHosts, opcion Como Entero
    
    // Inicialización
    numHosts <- 0
    
    // Menú principal
    Repetir
        Escribir "=== ESCANEO DE VULNERABILIDADES ==="
        Escribir "1. Registrar host"
        Escribir "2. Analizar vulnerabilidades"
        Escribir "3. Mostrar reporte"
        Escribir "4. Salir"
        Escribir "Seleccione una opción: "
        Leer opcion
        Limpiar Pantalla
        
        Segun opcion Hacer
            1:
                RegistrarHost(hosts, servicios, intentos, vulnerabilidades, numHosts)
            2:
                AnalizarVulnerabilidades(hosts, servicios, intentos, vulnerabilidades, numHosts)
            3:
                MostrarReporte(hosts, servicios, intentos, vulnerabilidades, numHosts)
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

// Función para registrar host
SubProceso RegistrarHost(hosts, servicios, intentos, vulnerabilidades, numHosts Por Referencia)
    Definir host, servicio Como Caracter
    Definir i, j Como Entero
    
    Escribir "=== REGISTRAR HOST ==="
    
    Si numHosts >= 10 Entonces
        Escribir "Error: No hay espacio para más hosts"
    FinSi
    
    Escribir "Ingrese dirección del host: "
    Leer host
    
    numHosts <- numHosts + 1
    hosts[numHosts] <- host
    
    // Inicializar servicios para este host
    Escribir "Ingrese hasta 5 servicios para el host (deje vacío para terminar):"
    Para j <- 1 Hasta 5 Hacer
        Escribir "Servicio ", j, ": "
        Leer servicio
        Si servicio = "" Entonces
            servicios[numHosts, j] <- "---"
            intentos[numHosts, j] <- 0
            vulnerabilidades[numHosts, j] <- 0
        Sino
            servicios[numHosts, j] <- servicio
            intentos[numHosts, j] <- 0
            vulnerabilidades[numHosts, j] <- 0
        FinSi
    FinPara
    
    Escribir "Host registrado exitosamente"
FinSubProceso

// Función para analizar vulnerabilidades
SubProceso AnalizarVulnerabilidades(hosts, servicios, intentos, vulnerabilidades, numHosts)
    Definir i, j, intentosSimulados, vulnsSimuladas Como Entero
    
    Escribir "=== ANALIZAR VULNERABILIDADES ==="
    
    Si numHosts = 0 Entonces
        Escribir "No hay hosts para analizar"
    FinSi
    
    Escribir "Simulando escaneo de vulnerabilidades..."
    
    Para i <- 1 Hasta numHosts Hacer
        Escribir "Escaneando host: ", hosts[i]
        
        Para j <- 1 Hasta 5 Hacer
            Si servicios[i, j] <> "---" Entonces
                // Simular intentos de escaneo (1-10)
                intentosSimulados <- azar(10) + 1
                intentos[i, j] <- intentosSimulados
                
                // Simular vulnerabilidades encontradas (0-5)
                vulnsSimuladas <- azar(6)
                vulnerabilidades[i, j] <- vulnsSimuladas
                
                Escribir "  Servicio ", servicios[i, j], ": ", intentosSimulados, " intentos, ", vulnsSimuladas, " vulnerabilidades"
            FinSi
        FinPara
        Escribir ""
    FinPara
    
    Escribir "Análisis completado"
FinSubProceso

// Función para mostrar reporte
SubProceso MostrarReporte(hosts, servicios, intentos, vulnerabilidades, numHosts)
    Definir i, j, totalVulnerabilidades, totalIntentos, hostsRiesgoAlto Como Entero
    Definir riesgo Como Caracter
    
    Escribir "=== REPORTE DE VULNERABILIDADES ==="
    Escribir ""
    
    Si numHosts = 0 Entonces
        Escribir "No hay datos para mostrar"
    FinSi
    
    totalVulnerabilidades <- 0
    totalIntentos <- 0
    hostsRiesgoAlto <- 0
    
    // Reporte detallado por host
    Para i <- 1 Hasta numHosts Hacer
        Escribir "HOST: ", hosts[i]
        Escribir "SERVICIOS ESCANEADOS:"
        Escribir "----------------------"
        
        Para j <- 1 Hasta 5 Hacer
            Si servicios[i, j] <> "---" Entonces
                Escribir "  - ", servicios[i, j], ": "
                Escribir "    Intentos: ", intentos[i, j]
                Escribir "    Vulnerabilidades: ", vulnerabilidades[i, j]
                totalIntentos <- totalIntentos + intentos[i, j]
                totalVulnerabilidades <- totalVulnerabilidades + vulnerabilidades[i, j]
            FinSi
        FinPara
        
        // Calcular riesgo del host
        riesgo <- CalcularRiesgo(vulnerabilidades, i)
        Escribir "NIVEL DE RIESGO: ", riesgo
        Si riesgo = "ALTO" Entonces
            hostsRiesgoAlto <- hostsRiesgoAlto + 1
        FinSi
        Escribir ""
    FinPara
    
    // Reporte resumen
    Escribir "=== RESUMEN GENERAL ==="
    Escribir "Total de hosts: ", numHosts
    Escribir "Total de intentos de escaneo: ", totalIntentos
    Escribir "Total de vulnerabilidades encontradas: ", totalVulnerabilidades
    Escribir "Hosts con riesgo ALTO: ", hostsRiesgoAlto
    
    Si numHosts > 0 Entonces
        Escribir "Promedio de vulnerabilidades por host: ", totalVulnerabilidades / numHosts
    FinSi
FinSubProceso

// Función para calcular nivel de riesgo
SubProceso riesgo <- CalcularRiesgo(vulnerabilidades, hostIndex)
    Definir riesgo Como Caracter
    Definir totalVulns, j Como Entero
    
    totalVulns <- 0
    Para j <- 1 Hasta 5 Hacer
        totalVulns <- totalVulns + vulnerabilidades[hostIndex, j]
    FinPara
    
    Si totalVulns >= 5 Entonces
        riesgo <- "ALTO"
    Sino Si totalVulns >= 2 Entonces
			riesgo <- "MEDIO"
		Sino
			riesgo <- "BAJO"
		FinSi
	finsi
FinSubProceso
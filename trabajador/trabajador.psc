Algoritmo trabajador
	// ==========================================================
	// 			DEFINICION E INICIALIZACION DE VARIABLES   
	// ==========================================================
	Definir cantidadMisiones, cantidadTrabajadores, cantidadTrabajadoresPorMision Como Entero
	Definir i, j, indiceMisionAsignada Como Entero
	Definir maximoMisiones, maximoTrabajadores Como Entero
	Definir misiones, trabajadores, idTrabajador, trabajadoresPorMision Como Cadena
	Definir valido Como Logico
	maximoMisiones <- 20
	maximoTrabajadores <- 40
	Dimension misiones[maximoMisiones, 7]
	Dimension trabajadores[maximoTrabajadores, 3]
	// La fila representa la misión y las columnas los trabajadores asignados
	Dimension trabajadoresPorMision[maximoMisiones, 5]
	Dimension cantidadTrabajadoresPorMision[maximoMisiones]
	
	//=============================================
	// 			CARGA DE DATOS INICIALES
	//=============================================
	
	cargarBaseDatos(misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores)
	
	//==========================================================
	//          INGRESO Y SELECCION DEL TRABAJADOR
	//==========================================================
	Repetir
		
		mostrarTrabajadoresDisponibles(trabajadores, cantidadTrabajadores, idTrabajador)
		
		Si cantidadTrabajadores <> 0 Entonces
			// Solicita y valida el ID del trabajador
			Si ingresarIdTrabajador(IdTrabajador, cantidadTrabajadores) Entonces
				
				// Busca la misión asignada al trabajador seleccionado
				buscarMisionTrabajador(cantidadMisiones, cantidadTrabajadoresPorMision, idTrabajador, trabajadoresPorMision, indiceMisionAsignada)
				
				// Inicia el panel correspondiente al trabajador
				menuTrabajador(misiones, trabajadores, idTrabajador, indiceMisionAsignada, cantidadTrabajadores)
			FinSi
		SiNo
			Escribir ""
			Escribir "Si desea salir presione 0"
		FinSi
		Limpiar Pantalla
	Hasta Que idTrabajador = "0"  
FinAlgoritmo

// ==========================================================
//                        FUNCIONES
// ==========================================================

SubProceso mostrarTrabajadoresDisponibles(trabajadores, cantidadTrabajadores, idTrabajador Por Referencia)
	
	Definir i,j Como Entero
	
	Escribir ""
	Escribir "=========================================================="
	Escribir "                  PANEL DEL TRABAJADOR                    "
	Escribir "=========================================================="
	Escribir ""
	Si cantidadTrabajadores = 0 Entonces
		
		Escribir "No existen trabajadores cargados en el sistema."
		Escribir ""
		Escribir "Presione 0 para salir del sistema..."
		Leer idTrabajador
		
	SiNo
		Escribir "Trabajadores disponibles:"
		Escribir ""
		Para i<-1 Hasta cantidadTrabajadores Con Paso 1 Hacer
			Para j<-0 Hasta 2 Con Paso 1 Hacer
				Escribir Sin Saltar trabajadores[i, j] 
				Si j=0 Entonces
					Escribir Sin Saltar " - "
				SiNo
					Escribir Sin Saltar  " "
				FinSi
			FinPara
			Escribir  " "
		FinPara
	FinSi
	
	Escribir ""
	Escribir "Presione 0 para salir"
FinSubProceso

SubProceso valido <- ingresarIdTrabajador (idTrabajador por Referencia, cantidadTrabajadores)
	
	Definir valido Como Logico
	Escribir "Ingrese su ID de trabajador (ej: T01):"
	Leer idTrabajador
	Limpiar Pantalla
	
	valido <- validarIdTrabajador(idTrabajador, cantidadTrabajadores)
	
FinSubProceso

Funcion valido <- validarIdTrabajador(idTrabajador, cantTrabajadores)
	
	Definir valido Como Logico
	valido <- Falso
	Si idTrabajador <> "0" Entonces
		Si (Longitud(idTrabajador) <> 3) Entonces
			Escribir ""
			Escribir "[ERROR] Ese formato de ID no existe en el sistema"
			Escribir ""
			Escribir "Presione cualquier tecla para continuar..."
			Esperar Tecla
		SiNo
			Si Subcadena(idTrabajador,0,0) <> "T" Entonces
				Escribir ""
				Escribir "[ERROR] El ID debe comenzar con T"
				Escribir ""
				Escribir "Presione cualquier tecla para continuar..."
				Esperar Tecla
			SiNo
				Si ConvertirANumero(Subcadena(idTrabajador,1,2)) < 1 O ConvertirANumero(Subcadena(idTrabajador,1,2)) > cantTrabajadores Entonces
					Escribir ""
					Escribir "[ERROR] Ese trabajador no existe en el sistema"
					Escribir ""
					Escribir "Presione cualquier tecla para continuar..."
					Esperar Tecla
				SiNo
					valido <- Verdadero
				FinSi
			FinSi
		FinSi
	FinSi
FinFuncion

SubProceso buscarMisionTrabajador (cantidadMisiones, cantidadTrabajadoresPorMision, idTrabajador, trabajadoresPorMision, indiceMisionAsignada Por Referencia)
	
	indiceMisionAsignada <- 0
	Definir  i, j como entero
	Para i<-1 Hasta cantidadMisiones Con paso 1 Hacer
		Para j<-0 Hasta cantidadTrabajadoresPorMision[i]-1 Con Paso 1 Hacer
			Si idTrabajador = trabajadoresPorMision[i, j] Entonces
				indiceMisionAsignada <- i
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso menuTrabajador(misiones, trabajadores, idTrabajador, indiceMisionAsignada, cantidadTrabajadores)
	
	Definir numTrabajador, i, opcion Como Entero
	Para i<-1 Hasta cantidadTrabajadores Con Paso 1 Hacer
		Si idTrabajador = trabajadores[i,0] Entonces
			numTrabajador <- i
		FinSi
	FinPara
	Limpiar Pantalla
	Repetir
		Escribir ""
		Escribir "=========================================================="
		Escribir "                 MENU DEL TRABAJADOR"
		Escribir "=========================================================="
		Escribir "ID: ", idTrabajador
		Escribir "Bienvenido ", trabajadores[numTrabajador, 1], " ", trabajadores[numTrabajador, 2]
		Escribir ""
		Escribir "[1] Ver mision asignada"
		Escribir "[2] Ver estado"
		Escribir "[3] Cambiar estado"
		Escribir "[4] Cerrar sesion"
		Escribir "----------------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opcion
		
		Segun opcion Hacer
			1:
				verMision(misiones, indiceMisionAsignada)
			2:
				verEstado(misiones, indiceMisionAsignada)
			3:
				cambiarEstado(misiones, indiceMisionAsignada)
			4:
				Limpiar Pantalla
				Escribir ""
				Escribir "Cerrando sesion..."
				
			De Otro Modo:
				Escribir ""
				Escribir "Opcion incorrecta. Vuelva a intentarlo"
				
		FinSegun
		
	Hasta Que opcion = 4
	
	Esperar 2 Segundos
	Limpiar Pantalla
FinSubProceso

SubProceso verMision(misiones, misionActual)
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    MISION ASIGNADA                       |"
	Escribir "+----------------------------------------------------------+"
	
	Si misionActual <> 0 Entonces
		Escribir "| ID Mision    : ", misiones[misionActual, 0]
		Escribir "| Tipo         : ", misiones[misionActual, 1]
		Escribir "| Provincia    : ", misiones[misionActual, 2]
		Escribir "| Localidad    : ", misiones[misionActual, 3]
		Escribir "| Descripcion  : ", misiones[misionActual, 4]
		Escribir "| Nivel        : ", misiones[misionActual, 5]
		Escribir "+----------------------------------------------------------+"
	Sino
		Escribir "Este trabajador no tiene ninguna mision asignada"
	FinSi
	
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

SubProceso verEstado(misiones, misionActual)
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    ESTADO DE MISION                      |"
	Escribir "+----------------------------------------------------------+"
	Si misionActual <> 0 Entonces
		Escribir "| Mision: ", misiones[misionActual, 0]
		Escribir "| Estado actual: ", misiones[misionActual, 6]
		Escribir "+----------------------------------------------------------+"
	Sino
		Escribir "Este trabajador no tiene ninguna mision asignada"
	FinSi
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

SubProceso cambiarEstado(misiones, misionActual)
	
	Definir opcionEstado Como Entero
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    CAMBIAR ESTADO                        |"
	Escribir "+----------------------------------------------------------+"
	
	Si misionActual <> 0 Entonces
		Escribir "| Mision: ", misiones[misionActual, 0]
		Escribir "| Estado actual: ", misiones[misionActual, 6]
		Escribir ""
		
		Escribir "[1] En camino"
		Escribir "[2] En curso"
		Escribir "[3] Controlada"
		Escribir "[4] Volver"
		Escribir "----------------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opcionEstado
		
		Segun opcionEstado Hacer
			
			1:
				misiones[misionActual, 6] <- "En camino"
				Escribir ""
				Escribir "Estado actualizado: EN CAMINO"
				
			2:
				misiones[misionActual, 6] <- "En curso"
				Escribir ""
				Escribir "Estado actualizado: EN CURSO"
				
			3:
				misiones[misionActual, 6] <- "Controlada"
				Escribir ""
				Escribir "Estado actualizado: CONTROLADA"
				
			4:
				Limpiar Pantalla
				Escribir ""
				Escribir "Volviendo..."
				
			De Otro Modo:
				Escribir "Opcion incorrecta."
				
		FinSegun
	Sino
		Escribir "Este trabajador no tiene ninguna mision asignada"
	FinSi
	Escribir ""
	Escribir "Precione cualquier tecla para continuar"
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

// ==========================================================
//                  BASE DE DATOS FALSA
// ==========================================================

SubProceso cargarBaseDatos (misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones Por Referencia, cantidadTrabajadores Por Referencia)
	// Inicializar contadores
	cantidadMisiones <- 0
	cantidadTrabajadores <- 0
	
	// MISIÓN  N°1
	cantidadMisiones <- cantidadMisiones + 1
	
	misiones[1,0] <- "M01"
	misiones[1,1] <- "Inundacion"
	misiones[1,2] <- "Buenos Aires"
	misiones[1,3] <- "La Matanza"
	misiones[1,4] <- "Asistencia a familias afectadas"
	misiones[1,5] <- "ALTA"
	misiones[1,6] <- "En curso"
	
	// Trabajadores asignados a M01
	trabajadoresPorMision[1,0] <- "T01"
	trabajadoresPorMision[1,1] <- "T02"
	
	cantidadTrabajadoresPorMision[1] <- 2
	
	// MISIÓN  N°2
	cantidadMisiones <- cantidadMisiones + 1
	
	misiones[2,0] <- "M02"
	misiones[2,1] <- "Incendio"
	misiones[2,2] <- "Cordoba"
	misiones[2,3] <- "Villa Carlos Paz"
	misiones[2,4] <- "Evacuacion y entrega de suministros"
	misiones[2,5] <- "MEDIA"
	misiones[2,6] <- "En curso"
	
	// Trabajador asignado a M02
	trabajadoresPorMision[2,0] <- "T03"
	
	cantidadTrabajadoresPorMision[2] <- 1
	
	//TRABAJADOR N°1
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[1,0] <- "T01" 
	trabajadores[1,1] <- "Matias" 
	trabajadores[1,2] <- "Perez"
	
	//TRABAJADOR N°2 
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[2,0] <- "T02" 
	trabajadores[2,1] <- "Juan" 
	trabajadores[2,2] <- "Lopez"
	
	//TRABAJADOR N°3 
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[3,0] <- "T03" 
	trabajadores[3,1] <- "Nicolas" 
	trabajadores[3,2] <- "Gutierrez"
	
	//TRABAJADOR N°4
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[4,0] <- "T04" 
	trabajadores[4,1] <- "Lautaro" 
	trabajadores[4,2] <- "Diaz"
FinSubProceso
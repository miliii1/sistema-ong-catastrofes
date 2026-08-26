Algoritmo trabajador
	Definir idTrabajadorActual, idTrabajadorAsignado, cantMisiones Como Entero
	Definir tipoEmergencia, nombreTrabajador, apellidoTrabajador Como Cadena
	Definir provincia, localidad Como Cadena
	Definir descripcion, nivel, estado Como Cadena
	Dimension tipoEmergencia[20]
	Dimension provincia[20], localidad[20]
	Dimension descripcion[20], nivel[20], estado[20]
	Dimension idTrabajadorAsignado[20]
	Dimension nombreTrabajador[20], apellidoTrabajador[20]
	
	cargarBaseDatos(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador)
	
	// Seleccion e ingreso del trabajador
	Repetir
		
		Escribir ""
		Escribir "=========================================================="
		Escribir "                  PANEL DEL TRABAJADOR                    "
		Escribir "=========================================================="
		Escribir ""
		Escribir "Trabajadores disponibles:"
		Escribir ""
		Escribir "T01 - ", nombreTrabajador[1], " ", apellidoTrabajador[1]
		Escribir "T02 - ", nombreTrabajador[2], " ", apellidoTrabajador[2]
		Escribir "T03 - ", nombreTrabajador[3], " ", apellidoTrabajador[3]
		Escribir ""
		Escribir "Ingrese su ID numerico: (Ingrese 0 para salir)"
		Leer idTrabajadorActual
		
		Si idTrabajadorActual <> 0 Y (idTrabajadorActual < 1 O idTrabajadorActual > 3) Entonces
			Escribir "ID de trabajador incorrecto. Presione Enter para volver a intentarlo..."
			Esperar Tecla
		FinSi
		Si idTrabajadorActual>0 Entonces
			Limpiar Pantalla
			// Entra al menu con el Trabajador seleccionado
			menuTrabajador(idTrabajadorActual, tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones)
		FinSi
		
	Hasta Que idTrabajadorActual = 0  
	
FinAlgoritmo

// ==========================================================
//                  BASE DE DATOS FALSA
// ==========================================================

SubProceso cargarBaseDatos(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia)
	cantMisiones <- 3
	
	// MISIÓN  N°1
	tipoEmergencia[1] <- "Inundacion"
	provincia[1] <- "Buenos Aires"
	localidad[1] <- "La Matanza"
	descripcion[1] <- "Asistencia a familias afectadas"
	nivel[1] <- "ALTA"
	estado[1] <- "En curso"
	nombreTrabajador[1] <- "Matias"
	apellidoTrabajador[1] <- "Perez"
	idTrabajadorAsignado[1] <- 3
	
	// MISIÓN N°2
	tipoEmergencia[2] <- "Incendio"
	provincia[2] <- "Cordoba"
	localidad[2] <- "Villa Carlos Paz"
	descripcion[2] <- "Evacuacion y entrega de suministros"
	nivel[2] <- "MEDIA"
	estado[2] <- "En camino"
	nombreTrabajador[2] <- "Juan"
	apellidoTrabajador[2] <- "Lopez"
	idTrabajadorAsignado[2] <- 2
	
	// MISIÓN  N°3
	tipoEmergencia[3] <- "Terremoto"
	provincia[3] <- "Mendoza"
	localidad[3] <- "Godoy Cruz"
	descripcion[3] <- "Entrega de kits medicos"
	nivel[3] <- "BAJA"
	estado[3] <- "Pendiente"
	nombreTrabajador[3] <- "Nicolas"
	apellidoTrabajador[3] <- "Gutierrez"
	idTrabajadorAsignado[3] <- 1
	
FinSubProceso

// ==========================================================
//                        VER MISION
// ==========================================================
SubProceso verMision(idTrabajadorActual Por Valor, tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	
	Definir i Como Entero
	Definir encontrada Como Logico
	
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    MISION ASIGNADA                       |"
	Escribir "+----------------------------------------------------------+"
	
	Para i <- 1 Hasta cantMisiones Hacer
		
		Si idTrabajadorAsignado[i] = idTrabajadorActual Entonces
			
			encontrada <- Verdadero
			Escribir "| ID Mision    : M0", i
			Escribir "| Tipo         : ", tipoEmergencia[i]
			Escribir "| Provincia    : ", provincia[i]
			Escribir "| Localidad    : ", localidad[i]
			Escribir "| Descripcion  : ", descripcion[i]
			Escribir "| Nivel        : ", nivel[i]
			Escribir "| Estado       : ", estado[i]
			Escribir "+----------------------------------------------------------+"
			
		FinSi
	FinPara
	
	Si encontrada = Falso Entonces
		
		Escribir "| No tiene ninguna mision asignada.                       |"
		Escribir "+----------------------------------------------------------+"
		
	FinSi
	
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	
FinSubProceso

// ==========================================================
//                  FUNCION: VER ESTADO
// ==========================================================
SubProceso verEstado(idTrabajadorActual Por Valor, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	
	Definir i Como Entero
	Definir encontrada Como Logico
	
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    ESTADO DE MISION                      |"
	Escribir "+----------------------------------------------------------+"
	
	Para i <- 1 Hasta cantMisiones Hacer
		
		Si idTrabajadorAsignado[i] = idTrabajadorActual Entonces
			
			encontrada <- Verdadero
			
			Escribir "| Mision: M0", i
			Escribir "| Estado actual: ", estado[i]
			Escribir "+----------------------------------------------------------+"
			
		FinSi
	FinPara
	
	Si encontrada = Falso Entonces
		
		Escribir "| No tiene ninguna mision asignada.                       |"
		Escribir "+----------------------------------------------------------+"
		
	FinSi
	
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	
FinSubProceso

// ==========================================================
//                  FUNCION: CAMBIAR ESTADO
// ==========================================================
SubProceso cambiarEstado(idTrabajadorActual Por Valor, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	
	Definir i, opcEstado Como Entero
	Definir encontrada Como Logico
	
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    CAMBIAR ESTADO                        |"
	Escribir "+----------------------------------------------------------+"
	
	Para i <- 1 Hasta cantMisiones Hacer
		
		Si idTrabajadorAsignado[i] = idTrabajadorActual Entonces
			
			encontrada <- Verdadero
			
			Escribir "Mision: M0", i
			Escribir "Estado actual: ", estado[i]
			Escribir ""
			
			Escribir "[1] En camino"
			Escribir "[2] En curso"
			Escribir "[3] Controlada"
			Escribir "[4] Volver"
			Escribir "----------------------------------------------------------"
			Escribir "Seleccione una opcion: "
			Leer opcEstado
			
			Segun opcEstado Hacer
				
				1:
					estado[i] <- "En camino"
					Escribir ""
					Escribir "Estado actualizado: EN CAMINO"
					
				2:
					estado[i] <- "En curso"
					Escribir ""
					Escribir "Estado actualizado: EN CURSO"
					
				3:
					estado[i] <- "Controlada"
					Escribir ""
					Escribir "Estado actualizado: CONTROLADA"
					
				4:
					Escribir "Volviendo..."
					
				De Otro Modo:
					Escribir "Opcion incorrecta."
					
			FinSegun
			
		FinSi
	FinPara
	
	Si encontrada = Falso Entonces
		
		Escribir "No tiene ninguna mision asignada."
		
	FinSi
	
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	
FinSubProceso

// ==========================================================
//                  MENU DEL TRABAJADOR
// ==========================================================
SubProceso menuTrabajador(idTrabajadorActual Por Valor, tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	
	Definir opcion Como Entero
	
	Repetir
		Escribir ""
		Escribir "=========================================================="
		Escribir "                  PANEL DE TRABAJADOR"
		Escribir "=========================================================="
		Escribir "ID de trabajador: T0", idTrabajadorActual
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
				verMision(idTrabajadorActual, tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones)
			2:
				verEstado(idTrabajadorActual, estado, idTrabajadorAsignado, cantMisiones)
			3:
				cambiarEstado(idTrabajadorActual, estado, idTrabajadorAsignado, cantMisiones)
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

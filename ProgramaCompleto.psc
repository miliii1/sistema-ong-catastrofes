Algoritmo Unificar_proyecto
	// Acá nuestro codigo

		Definir opcion, cantMisiones Como Entero
		Definir tipoEmergencia, provincia, localidad, descripcion, confirmacion, nivel Como Cadena
		Dimension tipoEmergencia[20], provincia[20], localidad[20], descripcion[20], nivel[20]
		
		Definir idTrabajadorActual, idTrabajadorAsignado Como Entero
		Definir nombreTrabajador, apellidoTrabajador Como Cadena
		Definir estado Como Cadena
		Dimension estado[20]
		Dimension idTrabajadorAsignado[20]
		Dimension nombreTrabajador[20], apellidoTrabajador[20]
		
		Definir num Como Entero
		Repetir 
			Borrar Pantalla
			Escribir "ONG-CATASTROFES" 
			Escribir "1- Trabajador"
			Escribir "2- Coordinador"
			Escribir "0 - Salir"
			Leer num
			Segun num Hacer
				1:
					trabajador(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador);
				2:
					coordinador(tipoEmergencia, provincia, localidad, descripcion, nivel, idTrabajadorAsignado, nombreTrabajador, apellidoTrabajador);
				De Otro Modo:
					Escribir "Saliendo del sistema..."
			Fin Segun
		Hasta Que num=0 
FinAlgoritmo

SubProceso  coordinador (tipoEmergencia, provincia, localidad, descripcion, nivel, idTrabajadorAsignado, nombreTrabajador, apellidoTrabajador)
	
	
	cantMisiones <- 1
	
	Repetir
		Borrar Pantalla 
		Escribir " ================ PANEL DE COORDINADOR ================ "
		Escribir "[1] Crear misión      [2] Misiones Activas      [3] Asignar trabajadores      [4] Ver Stock      [5] Cerrar Sesión "
		Escribir "--------------------------------------------------------------------------------------------------------------------"
		Escribir "Seleccione una opción: "
		Leer opcion
		
		Segun opcion Hacer
			1:
				Borrar Pantalla
				Si cantMisiones <= 20 Entonces
					crearMision(tipoEmergencia, provincia, localidad, descripcion, nivel, cantMisiones)
					Si tipoEmergencia[cantMisiones] <> "" Entonces
						cantMisiones <- cantMisiones + 1
					FinSi
				SiNo
					Escribir "Limites de misiones alcanzados"
					Escribir "Presione una tecla para continuar..."
					Esperar Tecla
				FinSi
			2:
				Borrar Pantalla
				mostrarMisionesActivas(tipoEmergencia, provincia, nivel, cantMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			3:
				Borrar Pantalla
				asignarTrabajadores(tipoEmergencia, provincia, nivel, cantMisiones, nombreTrabajador, apellidoTrabajador, idTrabajadorAsignado)
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			4:
				Borrar Pantalla
				Escribir "--- VER STOCK ---"
				Escribir "Módulo en desarrollo."
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			5:
				Borrar Pantalla
				Escribir "Sistema cerrado correctamente."
			De Otro Modo:
				Escribir "Opción Incorrecta. Ingrese un número válido."
		FinSegun
	Hasta Que opcion = 5
FinSubProceso



// ======================================= Función donde se crea una misión
SubProceso crearMision(tipoEmerge Por Referencia, prov Por Referencia, local Por Referencia, descrip Por Referencia, unNivel Por Referencia, i Por Valor)
	Definir confirmacion Como Cadena
	
	Escribir "--- CREAR NUEVA MISIÓN ---"
	Escribir "Tipo de emergencia: "
	Leer tipoEmerge[i]
	Escribir "Zona / Provincia: "
	Leer prov[i]
	Escribir "Localidad / Area: "
	Leer local[i]
	Escribir "Descripción: "
	Leer descrip[i]
	Escribir "Nivel de urgencia [1] BAJA   [2] MEDIA   [3] ALTA: "
	Leer unNivel[i]
	
	// Mostrar vista previa
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                 VISTA PREVIA DE LA MISION                |"
	Escribir "+----------------------------------------------------------+"
	Escribir "| Tipo      : ", tipoEmerge[i]
	Escribir "| Ubicacion : ", prov[i], " - ", local[i]
	Escribir "| Urgencia  : ", unNivel[i]
	Escribir "| Detalle   : ", descrip[i]
	Escribir "+----------------------------------------------------------+"
	Escribir ""
	
	Repetir
		Escribir "¿CONFIRMAR CREACION DE LA MISION? (S/N): "
		Leer confirmacion
		confirmacion <- Mayusculas(confirmacion)
		
		Si confirmacion <> "S" Y confirmacion <> "N" Entonces
			Escribir "[ERROR] Opción inválida. Debe ingresar obligatoriamente S o N."
		FinSi
	Hasta Que confirmacion = "S" O confirmacion = "N"
	
	Si confirmacion = "S" Entonces
		Escribir "----------------------------------------------------------"
		Escribir "  [OK] MISION REGISTRADA EXITOSAMENTE CON ID: M", i
		Escribir "----------------------------------------------------------"
	SiNo
		Escribir "----------------------------------------------------------"
		Escribir "  [X] MISION CANCELADA. Los datos no se guardaron."
		Escribir "----------------------------------------------------------"
		tipoEmerge[i] <- ""
		prov[i] <- ""
		local[i] <- ""
		descrip[i] <- ""
		unNivel[i] <- ""
	FinSi
	
	Escribir ""
	Escribir "Presione una tecla para continuar..."
	Esperar Tecla
FinSubProceso

// ======================================= Función donde se visualizan las misiones
SubProceso mostrarMisionesActivas(tipoEmerge Por Referencia, prov Por Referencia, unNivel Por Referencia, totalMisiones Por Valor)
	Definir j Como Entero
	
	Escribir "--- MISIONES ACTIVAS ---"
	Escribir "+------+------------------------------+---------------+-------------+"
	Escribir "| ID   | Tipo de emergencia           | Zona          |   Urgencia  |"
	Escribir "+------+------------------------------+---------------+-------------+"
	
	Si totalMisiones = 1 Entonces
		Escribir "|  --  | No hay misiones activas registradas          |  --         |"
	SiNo
		Para j <- 1 Hasta totalMisiones - 1 Con Paso 1 Hacer
			Escribir "| M0", j, "  | ", tipoEmerge[j], "                   | ", prov[j], "         |      ", unNivel[j], "      |"
		FinPara
	FinSi
	
	Escribir "+------+------------------------------+---------------+-------------+"
FinSubProceso

// ======================================= Función para asignar Trabajador
SubProceso asignarTrabajadores(tipoEmerge Por Referencia, prov Por Referencia, unNivel Por Referencia, totalMisiones Por Valor, nombreTrabajador, apellidoTrabajador, idTrabajadorAsignado Por Referencia)
	Definir idMision, confirmacion Como Cadena
	Definir j Como Entero
	
	Escribir "--- ASIGNAR TRABAJADORES ---"
	Escribir "Seleccione la misión a la que desea asignar trabajadores:"
	Escribir "+------+-------------------------------+--------------------+----------+"
	Escribir "| ID   | Tipo de emergencia           | Zona               | Urgencia |"
	Escribir "+------+-------------------------------+--------------------+----------+"
	
	Si totalMisiones = 1 Entonces
		Escribir "|  --  | No hay misiones registradas   | --                 | --       |"
		Escribir "+------+-------------------------------+--------------------+----------+"
	SiNo
		Para j <- 1 Hasta totalMisiones - 1 Con Paso 1 Hacer
			Escribir "| M0", j, "  | ", tipoEmerge[j], "                   | ", prov[j], "              | ", unNivel[j], "        |"
		FinPara
		Escribir "+------+-------------------------------+--------------------+----------+"
		
		Escribir ""
		Escribir "Ingrese ID de la misión (ej: 1): "
		Leer idMision
		
		Escribir ""
		Escribir "LISTA DE TRABAJADORES DISPONIBLES"
		Escribir "+------+--------------------+--------------------+------------+"
		Escribir "| ID   | Nombre y Apellido  | Especialidad       | Estado     |"
		Escribir "+------+--------------------+--------------------+------------+"
		Escribir "| T01  | Pepito Suarez      | Logistica          | Disponible |"
		Escribir "| T02  | Lionel Messi       | Medico             | Disponible |"
		Escribir "| T03  | Carlitos Bala      | Rescate            | Disponible |"
		Escribir "+------+--------------------+--------------------+------------+"
		
		Escribir ""
		Escribir "Ingrese ID del trabajador a asignar (ej: T02): "
		Leer idTrabajadorAsignado[1]
		nombreTrabajador[1] <- "Lionel"
		apellidoTrabajador[1] <- "Messi"
		
		Escribir ""
		Escribir "+----------------------------------------------------------+"
		Escribir "|                   CONFIRMAR ASIGNACION                   |"
		Escribir "+----------------------------------------------------------+"
		Escribir "| Mision : M0", idMision
		Escribir "| Personal: ", idTrabajador
		Escribir "+----------------------------------------------------------+"
		
		Repetir
			Escribir "¿CONFIRMAR ASIGNACION DEL TRABAJADOR? (S/N): "
			Leer confirmacion
			confirmacion <- Mayusculas(confirmacion)
			
			Si confirmacion <> "S" Y confirmacion <> "N" Entonces
				Escribir "[ERROR] Opción inválida. Debe ingresar obligatoriamente S o N."
			FinSi
		Hasta Que confirmacion = "S" O confirmacion = "N"
		
		Si confirmacion = "S" Entonces
			Escribir " [OK] Trabajador ", idTrabajador, " asignado a la misión M0", idMision
		SiNo
			Escribir " [X] Asignación cancelada."
		FinSi
	FinSi
FinSubProceso


SubProceso  trabajador(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador)
	
	
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
	
FinSubProceso


// ==========================================================
//                  BASE DE DATOS FALSA
// ==========================================================

SubProceso cargarBaseDatos(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia)
	cantMisiones <- 3
	
	
	
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


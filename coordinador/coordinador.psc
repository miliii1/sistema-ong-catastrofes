Algoritmo coordinador
	Definir opcion, cantMisiones Como Entero
	Definir confirmacion Como Cadena
	Definir misiones Como Cadena
	Dimension misiones[20, 6]
	
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
					crearMision(misiones, cantMisiones)
					Si misiones[cantMisiones, 1] <> "" Entonces
						cantMisiones <- cantMisiones + 1
					FinSi
				SiNo
					Escribir "Limites de misiones alcanzados"
					Escribir "Presione una tecla para continuar..."
					Esperar Tecla
				FinSi
			2:
				Borrar Pantalla
				mostrarMisionesActivas(misiones, cantMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			3:
				Borrar Pantalla
				asignarTrabajadores(misiones, cantMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			4:
				Borrar Pantalla
				Escribir "--- VER STOCK ---"
				verStock()
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			5:
				Borrar Pantalla
				Escribir "Sistema cerrado correctamente."
			De Otro Modo:
				Escribir "Opción Incorrecta. Ingrese un número válido."
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
		FinSegun
	Hasta Que opcion = 5
FinAlgoritmo

// ======================================= Función donde se crea una misión
SubProceso crearMision(misiones Por Referencia, i Por Valor)
	Definir confirmacion Como Cadena
	
	Escribir "--- CREAR NUEVA MISIÓN ---"
	Escribir "Tipo de emergencia: "
	Leer misiones[i, 1]
	Escribir "Zona / Provincia: "
	Leer misiones[i, 2]
	Escribir "Localidad / Area: "
	Leer misiones[i, 3]
	Escribir "Descripción: "
	Leer misiones[i, 4]
	Escribir "Nivel de urgencia [1] BAJA   [2] MEDIA   [3] ALTA: "
	Leer misiones[i, 5]
	
	// Mostrar vista previa
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                 VISTA PREVIA DE LA MISION                |"
	Escribir "+----------------------------------------------------------+"
	Escribir "| Tipo      : ", misiones[i, 1]
	Escribir "| Ubicacion : ", misiones[i, 2], " - ", misiones[i, 3]
	Escribir "| Urgencia  : ", misiones[i, 5]
	Escribir "| Detalle   : ", misiones[i, 4]
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
		// Aqui se borra y limpia
		misiones[i, 1] <- ""
		misiones[i, 2] <- ""
		misiones[i, 3] <- ""
		misiones[i, 4] <- ""
		misiones[i, 5] <- ""
	FinSi
	
	Escribir ""
	Escribir "Presione una tecla para continuar..."
	Esperar Tecla
FinSubProceso

// ======================================= Función donde se visualizan las misiones
SubProceso mostrarMisionesActivas(misiones Por Referencia, totalMisiones Por Valor)
	Definir j Como Entero
	
	Escribir "--- MISIONES ACTIVAS ---"
	Escribir "+------+------------------------------+---------------+-------------+"
	Escribir "| ID   | Tipo de emergencia           | Zona          |   Urgencia  |"
	Escribir "+------+------------------------------+---------------+-------------+"
	
	Si totalMisiones = 1 Entonces
		Escribir "|  --  | No hay misiones activas registradas          |  --         |"
	SiNo
		Para j <- 1 Hasta totalMisiones - 1 Con Paso 1 Hacer
			Escribir "| M0", j, "  | ", misiones[j, 1], "                   | ", misiones[j, 2], "         |      ", misiones[j, 5], "      |"
		FinPara
	FinSi
	
	Escribir "+------+------------------------------+---------------+-------------+"
FinSubProceso

// ======================================= Función para asignar Trabajador
SubProceso asignarTrabajadores(misiones Por Referencia, totalMisiones Por Valor)
	Definir idMision, idTrabajador, confirmacion Como Cadena
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
			Escribir "| M0", j, "  | ", misiones[j, 1], "                   | ", misiones[j, 2], "              | ", misiones[j, 5], "        |"
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
		Leer idTrabajador
		
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

// ======================================= Función para ver stock

SubProceso verStock()
	Escribir "--- CONTROL DE STOCK E INSUMOS ---"
FinSubProceso

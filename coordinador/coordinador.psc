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
				gestionarStock()
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
SubProceso gestionarStock()
	Definir stock Como Cadena
	Definir opStock, filaMod, totalStock Como Entero
	Definir nuevaCant, nuevoEstado Como Cadena
	Definir j Como Entero
	
	Dimension stock[10, 7]
	totalStock <- 5
	
	stock[1, 1] <- "S01" 
	stock[1, 2] <- "Agua Mineral (Pack)     "    
	stock[1, 3] <- "Hidratacion  "  
	stock[1, 4] <- "120        "
	stock[1, 5] <- "lts"
	stock[1, 6] <- "Optimo"
	
	stock[2, 1] <- "S02" 
	stock[2, 2] <- "Alimentos No Perecederos" 
	stock[2, 3] <- "Alimentacion " 
	stock[2, 4] <- "45         "
	stock[2, 5] <- "Klg"
	stock[2, 6] <- "Bajo"
	
	stock[3, 1] <- "S03" 
	stock[3, 2] <- "Kits Primeros Auxilios  "   
	stock[3, 3] <- "Medicamentos " 
	stock[3, 4] <- "12         "
	stock[3, 5] <- "uds"
	stock[3, 6] <- "Critico"
	
	stock[4, 1] <- "S04" 
	stock[4, 2] <- "Cascos y Arneses        "         
	stock[4, 3] <- "Rescate      "      
	stock[4, 4] <- "30         "
	stock[4, 5] <- "uds"
	stock[4, 6] <- "Optimo"
	
	stock[5, 1] <- "S05" 
	stock[5, 2] <- "Radios VHF Portátiles   "     
	stock[5, 3] <- "Comunicacion " 
	stock[5, 4] <- "8          "
	stock[5, 5] <- "uds"
	stock[5, 6] <- "Bajo"
	
	Repetir
		Borrar Pantalla
		Escribir "--- GESTIÓN DE STOCK E INSUMOS ---"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Escribir "| ID   | Insumo / Recurso        | Categoria    | Cant Actual  | Unidad   | Estado   |"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Para j <- 1 Hasta 5 Hacer
			Escribir "| ", stock[j, 1], " | ", stock[j, 2], " |", stock[j, 3], " | ", stock[j, 4], "  | ", stock[j, 5], "      | ", stock[j, 6], "   | "
		FinPara
		Escribir "+------+-------------------------+--------------+--------------+----------+-----------+"
		Escribir ""
		Escribir "[1] Modificar cantidad y estado de un insumo"
		Escribir "[2] Agregar un nuevo insumo"
		Escribir "[3] Volver al menú principal"
		Escribir "Seleccione una opción: "
		Leer opStock
		
		Segun opStock Hacer
			1:
				Escribir ""
				Escribir "Ingrese el número de la fila del insumo a modificar (1 al 5): "
				Leer filaMod
				Si filaMod >= 1 Y filaMod <= totalStock Entonces
					Escribir "Insumo seleccionado: ", stock[filaMod, 2]
					Escribir "Ingrese la nueva cantidad actual: "
					Leer nuevaCant
					stock[filaMod, 4] <- nuevaCant
					
					Escribir "Ingrese el nuevo estado (Optimo / Bajo / Critico): "
					Leer nuevoEstado
					stock[filaMod, 6] <- nuevoEstado
					
					Escribir "[OK] Stock actualizado correctamente en memoria."
				SiNo
					Escribir "[ERROR] Número de fila inválido."
				FinSi
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
			2:
				Si totalStock < 10 Entonces
					totalStock <- totalStock + 1
					Escribir ""
					Escribir "--- AGREGAR NUEVO INSUMO ---"
					Escribir "Ingrese ID (ej: S06): "
					Leer stock[totalStock, 1]
					Escribir "Ingrese Nombre del Insumo: "
					Leer stock[totalStock, 2]
					Escribir "Ingrese Categoría (Hidratacion/Alimentacion/Medicamentos/Rescate/Comunicacion/Ropa): "
					Leer stock[totalStock, 3]
					Escribir "Ingrese Cantidad: "
					Leer stock[totalStock, 4]
					Escribir "Ingrese Unidad de medida (Litros/Kg/Unid): "
					Leer stock[totalStock, 5]
					Escribir "Ingrese Estado (Optimo/Bajo/Critico): "
					Leer stock[totalStock, 6]
					
					Escribir "[OK] Nuevo insumo agregado exitosamente al stock."
				SiNo
					Escribir "[ERROR] Se alcanzó el límite máximo de la matriz de stock (10 elementos)."
				FinSi
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			3:
			De Otro Modo:
				Escribir "Opción inválida."
				Esperar Tecla
		FinSegun
	Hasta Que opStock = 3
FinSubProceso

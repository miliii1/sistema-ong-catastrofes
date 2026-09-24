Algoritmo Unificar_proyecto
	Definir opcion, cantMisiones Como Entero
	Definir tipoEmergencia, provincia, localidad, descripcion, confirmacion, nivel Como Cadena
	Dimension tipoEmergencia[20], provincia[20], localidad[20], descripcion[20], nivel[20]
	
	Definir idTrabajadorActual Como Entero
	Definir idTrabajadorAsignado Como Entero
	Definir nombreTrabajador, apellidoTrabajador Como Cadena
	Definir estado Como Cadena
	Dimension estado[20]
	Dimension idTrabajadorAsignado[20]
	Dimension nombreTrabajador[20], apellidoTrabajador[20]
	Definir stock Como Cadena
	Definir totalStock Como Entero
	Dimension stock[10, 7]
	totalStock <- 5
	
	// Carga inicial de stock
	stock[1, 1] <- "S01"; stock[1, 2] <- "Agua Mineral (Pack)     "; stock[1, 3] <- "Hidratacion  "; stock[1, 4] <- "120        "; stock[1, 5] <- "lts"; stock[1, 6] <- "Optimo"
	stock[2, 1] <- "S02"; stock[2, 2] <- "Alimentos No Perecederos "; stock[2, 3] <- "Alimentacion "; stock[2, 4] <- "45         "; stock[2, 5] <- "Klg"; stock[2, 6] <- "Bajo"
	stock[3, 1] <- "S03"; stock[3, 2] <- "Kits Primeros Auxilios  "; stock[3, 3] <- "Medicamentos "; stock[3, 4] <- "12         "; stock[3, 5] <- "uds"; stock[3, 6] <- "Critico"
	stock[4, 1] <- "S04"; stock[4, 2] <- "Cascos y Arneses         "; stock[4, 3] <- "Rescate      "; stock[4, 4] <- "30         "; stock[4, 5] <- "uds"; stock[4, 6] <- "Optimo"
	stock[5, 1] <- "S05"; stock[5, 2] <- "Radios VHF Portatiles   "; stock[5, 3] <- "Comunicacion "; stock[5, 4] <- "8          "; stock[5, 5] <- "uds"; stock[5, 6] <- "Bajo"
	
	cantMisiones <- 0 
	
	Definir num Como Entero
	Repetir 
		Borrar Pantalla
		Escribir "ONG-CATASTROFES" 
		Escribir "1- Trabajador"
		Escribir "2- Coordinador"
		Escribir "3- Colaborador"
		Escribir "0 - Salir"
		Leer num
		Segun num Hacer
			1:
				trabajador(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador)
			2:
				coordinador(tipoEmergencia, provincia, localidad, descripcion, nivel, idTrabajadorAsignado, nombreTrabajador, apellidoTrabajador, cantMisiones, stock, totalStock)
			3:
				colaborador(tipoEmergencia, provincia, localidad, descripcion, nivel, cantMisiones, stock, totalStock)
			De Otro Modo:
				Escribir "Saliendo del sistema..."
		FinSegun
	Hasta Que num = 0
FinAlgoritmo

// ======================================= Subproceso Menú Colaborador
SubProceso colaborador(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, cantMisiones Por Valor, stock Por Referencia, totalStock Por Referencia)
	Definir opcColab Como Entero
	
	Repetir
		Borrar Pantalla
		Escribir "================ PANEL DE COLABORADOR ================"
		Escribir "[1] Ver misiones publicas"
		Escribir "[2] Simular donacion de insumos"
		Escribir "[3] Volver al menu principal"
		Escribir "-----------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opcColab
		
		Segun opcColab Hacer
			1:
				VerMisionesPublicas(tipoEmergencia, provincia, nivel, cantMisiones)
			2:
				simularDonacionInsumos(tipoEmergencia, provincia, localidad, cantMisiones, stock, totalStock)
			3:
				Escribir "Volviendo al menu principal..."
			De Otro Modo:
				Escribir "Opcion invalida."
				Esperar Tecla
		FinSegun
	Hasta Que opcColab = 3
FinSubProceso

// ======================================= Subproceso Simular Donación
SubProceso simularDonacionInsumos(tipoEmerge Por Referencia, prov Por Referencia, local Por Referencia, totalMisiones Por Valor, stock Por Referencia, totalStock Por Referencia)
	Definir insumo, nuevaUnidad, categ Como Cadena
	Definir cantidad, i, numMision, posInsumo, cantActualNum Como Entero
	Definir encontrado Como Logico
	
	Borrar Pantalla
	Escribir "======== SIMULACION DE DONACIONES ========"
	Escribir ""
	
	Si totalMisiones <= 1 Entonces
		Escribir "No hay misiones disponibles para recibir donaciones en este momento."
		Escribir "Presione una tecla para regresar..."
		Esperar Tecla
	SiNo
		Escribir "Misiones activas a las que puede donar:"
		Para i <- 1 Hasta totalMisiones - 1 Con Paso 1 Hacer
			Escribir "ID: M0", i, " | Tipo: ", tipoEmerge[i], " | Zona: ", prov[i], " (", local[i], ")"
		FinPara
		Escribir "-----------------------------------------------------"
		
		Escribir "Ingrese el numero de ID de la mision a la que desea donar (ej: 1): "
		Leer numMision
		
		Si numMision >= 1 Y numMision <= (totalMisiones - 1) Entonces
			Escribir ""
			Escribir "Mision seleccionada: M0", numMision, " - ", tipoEmerge[numMision]
			Escribir "Ingrese el insumo a donar (ej: Agua, Alimentos, Mantas): "
			Leer insumo
			
			Escribir "Ingrese la cantidad a donar: "
			Leer cantidad
			
			Si cantidad > 0 Entonces
				// Buscar si el insumo existe en el stock actual
				encontrado <- Falso
				Para i <- 1 Hasta totalStock Hacer
					Si Posicion(Minusculas(stock[i, 2]), Minusculas(insumo)) > 0 O Posicion(Minusculas(insumo), Minusculas(stock[i, 2])) > 0 Entonces
						encontrado <- Verdadero
						posInsumo <- i
					FinSi
				FinPara
				
				Si encontrado Entonces
					cantActualNum <- ConvertirANumero(stock[posInsumo, 4])
					cantActualNum <- cantActualNum + cantidad
					stock[posInsumo, 4] <- ConvertirATexto(cantActualNum)
				SiNo
					Si totalStock < 10 Entonces
						totalStock <- totalStock + 1
						stock[totalStock, 1] <- Concatenar("S0", ConvertirATexto(totalStock))
						stock[totalStock, 2] <- insumo
						stock[totalStock, 3] <- "Donacion"
						stock[totalStock, 4] <- ConvertirATexto(cantidad)
						stock[totalStock, 5] <- "uds"
						stock[totalStock, 6] <- "Optimo"
					FinSi
				FinSi
				
				Escribir ""
				Escribir "+----------------------------------------------------------+"
				Escribir "|          DONACION REGISTRADA Y APLICADA AL STOCK         |"
				Escribir "+----------------------------------------------------------+"
				Escribir "| Mision    : M0", numMision, " - ", tipoEmerge[numMision]
				Escribir "| Ubicacion : ", prov[numMision], " - ", local[numMision]
				Escribir "| Insumo    : ", insumo
				Escribir "| Cantidad  : ", cantidad
				Escribir "+----------------------------------------------------------+"
				Escribir "¡Muchas gracias por su colaboracion!"
			SiNo
				Escribir "[ERROR] La cantidad a donar debe ser un numero positivo."
			FinSi
		SiNo
			Escribir "[ERROR] ID de mision inexistente."
		FinSi
		
		Escribir ""
		Escribir "Presione una tecla para continuar..."
		Esperar Tecla
	FinSi
FinSubProceso

SubProceso coordinador (tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, idTrabajadorAsignado Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia, cantMisiones Por Referencia, stock Por Referencia, totalStock Por Referencia)
	Definir opcion Como Entero
	
	Si cantMisiones = 0 Entonces
		cantMisiones <- 1
	FinSi
	
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
				gestionarStock(stock, totalStock)
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			5:
				Borrar Pantalla
				Escribir "Sistema cerrado correctamente."
			De Otro Modo:
				Escribir "Opción Incorrecta. Ingrese un número válido."
				Esperar Tecla
		FinSegun
	Hasta Que opcion = 5
FinSubProceso

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
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                   VISTA PREVIA DE LA MISION              |"
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
			Escribir "| M0", j, "  | ", tipoEmerge[j], "                     | ", prov[j], "          |      ", unNivel[j], "      |"
		FinPara
	FinSi
	
	Escribir "+------+------------------------------+---------------+-------------+"
FinSubProceso

SubProceso asignarTrabajadores(tipoEmerge Por Referencia, prov Por Referencia, unNivel Por Referencia, totalMisiones Por Valor, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia, idTrabajadorAsignado Por Referencia)
	Definir idMision, idAsignadoStr, confirmacion Como Cadena
	Definir j Como Entero
	
	Escribir "--- ASIGNAR TRABAJADORES ---"
	Escribir "Seleccione la misión a la que desea asignar trabajadores:"
	Escribir "+------+-------------------------------+--------------------+----------+"
	Escribir "| ID   | Tipo de emergencia            | Zona               | Urgencia |"
	Escribir "+------+-------------------------------+--------------------+----------+"
	
	Si totalMisiones = 1 Entonces
		Escribir "|  --  | No hay misiones registradas   | --                 | --       |"
		Escribir "+------+-------------------------------+--------------------+----------+"
	SiNo
		Para j <- 1 Hasta totalMisiones - 1 Con Paso 1 Hacer
			Escribir "| M0", j, "  | ", tipoEmerge[j], "                     | ", prov[j], "                | ", unNivel[j], "        |"
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
		Leer idAsignadoStr
		
		idTrabajadorAsignado[1] <- 2
		nombreTrabajador[1] <- "Lionel"
		apellidoTrabajador[1] <- "Messi"
		
		Escribir ""
		Escribir "+----------------------------------------------------------+"
		Escribir "|                     CONFIRMAR ASIGNACION                 |"
		Escribir "+----------------------------------------------------------+"
		Escribir "| Mision : M0", idMision
		Escribir "| Personal: ", idAsignadoStr
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
			Escribir " [OK] Trabajador ", idAsignadoStr, " asignado a la misión M0", idMision
		SiNo
			Escribir " [X] Asignación cancelada."
		FinSi
	FinSi
FinSubProceso

SubProceso gestionarStock(stock Por Referencia, totalStock Por Referencia)
	Definir opStock, filaMod Como Entero
	Definir nuevaCant, nuevoEstado Como Cadena
	Definir j Como Entero
	
	Repetir
		Borrar Pantalla
		Escribir "--- GESTIÓN DE STOCK E INSUMOS ---"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Escribir "| ID   | Insumo / Recurso        | Categoria    | Cant Actual  | Unidad   | Estado   |"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		
		Para j <- 1 Hasta totalStock Hacer
			Escribir "| ", stock[j, 1], " | ", stock[j, 2], " |", stock[j, 3], " | ", stock[j, 4], "  | ", stock[j, 5], "     | ", stock[j, 6], "    | "
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
				Escribir "Ingrese el número de la fila del insumo a modificar (1 al ", totalStock, "): "
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
					Escribir "Ingrese Nombre del Insumo (máx. 23 carac.): "
					Leer stock[totalStock, 2]
					Escribir "Ingrese Categoría: "
					Leer stock[totalStock, 3]
					Escribir "Ingrese Cantidad: "
					Leer stock[totalStock, 4]
					Escribir "Ingrese Unidad de medida: "
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

SubProceso trabajador(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia)
	Definir idTrabajadorActual Como Entero
	
	cargarBaseDatos(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador)
	
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
		
		Si idTrabajadorActual > 0 Entonces
			Limpiar Pantalla
			menuTrabajador(idTrabajadorActual, tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones)
		FinSi
		
	Hasta Que idTrabajadorActual = 0  
FinSubProceso

SubProceso cargarBaseDatos(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia)
	cantMisiones <- 4
	
	tipoEmergencia[1] <- "Inundacion" 
	provincia[1] <- "Buenos Aires" 
	localidad[1] <- "La Matanza" 
	descripcion[1] <- "Asistencia a familias" 
	nivel[1] <- "ALTA" 
	estado[1] <- "En curso" 
	nombreTrabajador[1] <- "Matias" 
	apellidoTrabajador[1] <- "Perez" 
	idTrabajadorAsignado[1] <- 3
	
	tipoEmergencia[2] <- "Incendio"    
	provincia[2] <- "Cordoba"      
	localidad[2] <- "Villa Carlos Paz" 
	descripcion[2] <- "Evacuacion" 
	nivel[2] <- "MEDIA" 
	estado[2] <- "En camino" 
	nombreTrabajador[2] <- "Juan" 
	apellidoTrabajador[2] <- "Lopez" 
	idTrabajadorAsignado[2] <- 2
	
	tipoEmergencia[3] <- "Terremoto"   
	provincia[3] <- "Mendoza"      
	localidad[3] <- "Godoy Cruz" 
	descripcion[3] <- "Kits medicos" 
	nivel[3] <- "BAJA" 
	estado[3] <- "Pendiente" 
	nombreTrabajador[3] <- "Nicolas" 
	apellidoTrabajador[3] <- "Gutierrez" 
	idTrabajadorAsignado[3] <- 1
FinSubProceso

SubProceso verMision(idTrabajadorActual Por Valor, tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	Definir i Como Entero
	Definir encontrada Como Logico
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                     MISION ASIGNADA                      |"
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
		Escribir "| No tiene ninguna mision asignada.                        |"
		Escribir "+----------------------------------------------------------+"
	FinSi
	
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
FinSubProceso

SubProceso verEstado(idTrabajadorActual Por Valor, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	Definir i Como Entero
	Definir encontrada Como Logico
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                     ESTADO DE MISION                     |"
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
		Escribir "| No tiene ninguna mision asignada.                        |"
		Escribir "+----------------------------------------------------------+"
	FinSi
	
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
FinSubProceso

SubProceso cambiarEstado(idTrabajadorActual Por Valor, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	Definir i, opcEstado Como Entero
	Definir encontrada Como Logico
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                     CAMBIAR ESTADO                       |"
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
					Escribir "Estado actualizado: EN CAMINO"
				2:
					estado[i] <- "En curso"
					Escribir "Estado actualizado: EN CURSO"
				3:
					estado[i] <- "Controlada"
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
				Escribir "Cerrando sesion..."
			De Otro Modo:
				Escribir "Opcion incorrecta. Vuelva a intentarlo"
		FinSegun
		
	Hasta Que opcion = 4
	
	Esperar 2 Segundos
	Limpiar Pantalla
FinSubProceso

SubProceso VerMisionesPublicas(tipoEmerge Por Referencia, prov Por Referencia, unNivel Por Referencia, totalMisiones Por Valor)
	Definir j Como Entero
	
	Borrar Pantalla
	Escribir "======== MISIONES PUBLICAS DISPONIBLES ========"
	Escribir ""
	
	Si totalMisiones <= 1 Entonces
		Escribir "No hay misiones publicas disponibles en este momento."
	SiNo
		Para j <- 1 Hasta totalMisiones - 1 Con Paso 1 Hacer
			Escribir "ID Mision : M0", j
			Escribir "Tipo      : ", tipoEmerge[j]
			Escribir "Zona      : ", prov[j]
			Escribir "Urgencia  : ", unNivel[j]
			Escribir "---------------------------------------------"
		FinPara
	FinSi
	Escribir ""
	Escribir "Presione una tecla para volver al menú..."
	Esperar Tecla
FinSubProceso

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
	stock[1, 1] <- "S01"; stock[1, 2] <- "Agua Mineral (Pack)"; stock[1, 3] <- "Hidratacion"; stock[1, 4] <- "120"; stock[1, 5] <- "lts"; stock[1, 6] <- "Optimo"
	stock[2, 1] <- "S02"; stock[2, 2] <- "Alimentos No Perecederos"; stock[2, 3] <- "Alimentacion"; stock[2, 4] <- "45"; stock[2, 5] <- "Klg"; stock[2, 6] <- "Bajo"
	stock[3, 1] <- "S03"; stock[3, 2] <- "Kits Primeros Auxilios"; stock[3, 3] <- "Medicamentos"; stock[3, 4] <- "12"; stock[3, 5] <- "uds"; stock[3, 6] <- "Critico"
	stock[4, 1] <- "S04"; stock[4, 2] <- "Cascos y Arneses"; stock[4, 3] <- "Rescate"; stock[4, 4] <- "30"; stock[4, 5] <- "uds"; stock[4, 6] <- "Optimo"
	stock[5, 1] <- "S05"; stock[5, 2] <- "Radios VHF Portatiles"; stock[5, 3] <- "Comunicacion"; stock[5, 4] <- "8"; stock[5, 5] <- "uds"; stock[5, 6] <- "Bajo"
	
	// Precarga inicial de base de datos general (una sola vez)
	cargarBaseDatos(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador)
	
	Definir num Como Entero
	Repetir 
		Borrar Pantalla
		Escribir "================ ONG-CATASTROFES ================" 
		Escribir "1- Trabajador"
		Escribir "2- Coordinador"
		Escribir "3- Colaborador"
		Escribir "0 - Salir"
		Escribir "-------------------------------------------------"
		Escribir "Ingrese una opcion: "
		Leer num
		
		Segun num Hacer
			1:
				trabajador(tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones, nombreTrabajador, apellidoTrabajador)
			2:
				coordinador(tipoEmergencia, provincia, localidad, descripcion, nivel, idTrabajadorAsignado, nombreTrabajador, apellidoTrabajador, cantMisiones, stock, totalStock)
			3:
				colaborador(tipoEmergencia, provincia, localidad, descripcion, nivel, cantMisiones, stock, totalStock)
			De Otro Modo:
				Si num <> 0 Entonces
					Escribir "Opcion invalida."
					Esperar Tecla
				FinSi
		FinSegun
	Hasta Que num = 0
	
	Escribir "Saliendo del sistema..."
FinAlgoritmo

// ======================================= Cargador de Datos Iniciales
SubProceso cargarBaseDatos(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia)
	cantMisiones <- 3
	
	nombreTrabajador[1] <- "Matias"; apellidoTrabajador[1] <- "Perez" 
	nombreTrabajador[2] <- "Juan"; apellidoTrabajador[2] <- "Lopez" 
	nombreTrabajador[3] <- "Nicolas"; apellidoTrabajador[3] <- "Gutierrez" 

	tipoEmergencia[1] <- "Inundacion"; provincia[1] <- "Buenos Aires"; localidad[1] <- "La Matanza"; descripcion[1] <- "Asistencia a familias"; nivel[1] <- "ALTA"; estado[1] <- "En curso"; idTrabajadorAsignado[1] <- 3
	tipoEmergencia[2] <- "Incendio"; provincia[2] <- "Cordoba"; localidad[2] <- "Villa Carlos Paz"; descripcion[2] <- "Evacuacion"; nivel[2] <- "MEDIA"; estado[2] <- "En camino"; idTrabajadorAsignado[2] <- 2
	tipoEmergencia[3] <- "Terremoto"; provincia[3] <- "Mendoza"; localidad[3] <- "Godoy Cruz"; descripcion[3] <- "Kits medicos"; nivel[3] <- "BAJA"; estado[3] <- "Pendiente"; idTrabajadorAsignado[3] <- 1
FinSubProceso

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
	Definir insumo Como Cadena
	Definir cantidad, i, numMision, posInsumo, cantActualNum Como Entero
	Definir encontrado Como Logico
	
	Borrar Pantalla
	Escribir "======== SIMULACION DE DONACIONES ========"
	Escribir ""
	
	Si totalMisiones < 1 Entonces
		Escribir "No hay misiones disponibles para recibir donaciones en este momento."
		Escribir "Presione una tecla para regresar..."
		Esperar Tecla
	SiNo
		Escribir "Misiones activas a las que puede donar:"
		Para i <- 1 Hasta totalMisiones Con Paso 1 Hacer
			Escribir "ID: M0", i, " | Tipo: ", tipoEmerge[i], " | Zona: ", prov[i], " (", local[i], ")"
		FinPara
		Escribir "-----------------------------------------------------"
		
		Escribir "Ingrese el numero de ID de la mision a la que desea donar (ej: 1): "
		Leer numMision
		
		Si numMision >= 1 Y numMision <= totalMisiones Entonces
			Escribir ""
			Escribir "Mision seleccionada: M0", numMision, " - ", tipoEmerge[numMision]
			Escribir "Ingrese el insumo a donar (ej: Agua, Alimentos, Mantas): "
			Leer insumo
			
			Escribir "Ingrese la cantidad a donar: "
			Leer cantidad
			
			Si cantidad > 0 Entonces
				encontrado <- Falso
				Para i <- 1 Hasta totalStock Hacer
					Si Minusculas(stock[i, 2]) = Minusculas(insumo) Entonces
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
	
	Repetir
		Borrar Pantalla 
		Escribir " ================ PANEL DE COORDINADOR ================ "
		Escribir "[1] Crear mision      [2] Misiones Activas      [3] Asignar trabajadores      [4] Ver Stock      [5] Cerrar Sesion "
		Escribir "--------------------------------------------------------------------------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opcion
		
		Segun opcion Hacer
			1:
				Borrar Pantalla
				Si cantMisiones < 20 Entonces
					crearMision(tipoEmergencia, provincia, localidad, descripcion, nivel, cantMisiones)
				SiNo
					Escribir "Limite de misiones alcanzado."
					Escribir "Presione una tecla para continuar..."
					Esperar Tecla
				FinSi
			2:
				Borrar Pantalla
				mostrarMisionesActivas(tipoEmergencia, provincia, nivel, cantMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			3:
				Borrar Pantalla
				asignarTrabajadores(tipoEmergencia, provincia, nivel, cantMisiones, nombreTrabajador, apellidoTrabajador, idTrabajadorAsignado)
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			4:
				Borrar Pantalla
				gestionarStock(stock, totalStock)
			5:
				Borrar Pantalla
				Escribir "Sesion de coordinador cerrada."
			De Otro Modo:
				Escribir "Opcion Incorrecta. Ingrese un numero valido."
				Esperar Tecla
		FinSegun
	Hasta Que opcion = 5
FinSubProceso

SubProceso crearMision(tipoEmerge Por Referencia, prov Por Referencia, local Por Referencia, descrip Por Referencia, unNivel Por Referencia, cantMisiones Por Referencia)
	Definir confirmacion Como Cadena
	Definir posLibre Como Entero
	posLibre <- cantMisiones + 1
	
	Escribir "--- CREAR NUEVA MISION ---"
	Escribir "Tipo de emergencia: "
	Leer tipoEmerge[posLibre]
	Escribir "Zona / Provincia: "
	Leer prov[posLibre]
	Escribir "Localidad / Area: "
	Leer local[posLibre]
	Escribir "Descripcion: "
	Leer descrip[posLibre]
	Escribir "Nivel de urgencia [1] BAJA   [2] MEDIA   [3] ALTA: "
	Leer unNivel[posLibre]
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    VISTA PREVIA DE LA MISION             |"
	Escribir "+----------------------------------------------------------+"
	Escribir "| Tipo      : ", tipoEmerge[posLibre]
	Escribir "| Ubicacion : ", prov[posLibre], " - ", local[posLibre]
	Escribir "| Urgencia  : ", unNivel[posLibre]
	Escribir "| Detalle   : ", descrip[posLibre]
	Escribir "+----------------------------------------------------------+"
	Escribir ""
	
	Repetir
		Escribir "¿CONFIRMAR CREACION DE LA MISION? (S/N): "
		Leer confirmacion
		confirmacion <- Mayusculas(confirmacion)
		
		Si confirmacion <> "S" Y confirmacion <> "N" Entonces
			Escribir "[ERROR] Opcion invalida. Debe ingresar obligatoriamente S o N."
		FinSi
	Hasta Que confirmacion = "S" O confirmacion = "N"
	
	Si confirmacion = "S" Entonces
		cantMisiones <- cantMisiones + 1
		Escribir "----------------------------------------------------------"
		Escribir "  [OK] MISION REGISTRADA EXITOSAMENTE CON ID: M0", cantMisiones
		Escribir "----------------------------------------------------------"
	SiNo
		Escribir "----------------------------------------------------------"
		Escribir "  [X] MISION CANCELADA. Los datos no se guardaron."
		Escribir "----------------------------------------------------------"
		tipoEmerge[posLibre] <- ""
		prov[posLibre] <- ""
		local[posLibre] <- ""
		descrip[posLibre] <- ""
		unNivel[posLibre] <- ""
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
	
	Si totalMisiones = 0 Entonces
		Escribir "|  --  | No hay misiones activas registradas          |  --         |"
	SiNo
		Para j <- 1 Hasta totalMisiones Con Paso 1 Hacer
			Escribir "| M0", j, "  | ", tipoEmerge[j], "                        | ", prov[j], "          |      ", unNivel[j], "      |"
		FinPara
	FinSi
	
	Escribir "+------+------------------------------+---------------+-------------+"
FinSubProceso

SubProceso asignarTrabajadores(tipoEmerge Por Referencia, prov Por Referencia, unNivel Por Referencia, totalMisiones Por Valor, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia, idTrabajadorAsignado Por Referencia)
	Definir idAsignadoNum, idMisionNum, j Como Entero
	Definir confirmacion Como Cadena
	
	Escribir "--- ASIGNAR TRABAJADORES ---"
	Si totalMisiones = 0 Entonces
		Escribir "No hay misiones registradas para asignar personal."
	SiNo
		mostrarMisionesActivas(tipoEmerge, prov, unNivel, totalMisiones)
		
		Escribir ""
		Escribir "Ingrese numero ID de la mision (ej: 1): "
		Leer idMisionNum
		
		Si idMisionNum >= 1 Y idMisionNum <= totalMisiones Entonces
			Escribir ""
			Escribir "LISTA DE TRABAJADORES DISPONIBLES"
			Escribir "+------+--------------------+--------------------+------------+"
			Escribir "| ID   | Nombre y Apellido  | Estado             |"
			Escribir "+------+--------------------+--------------------+------------+"
			Escribir "| 1    | Matias Perez       | Disponible         |"
			Escribir "| 2    | Juan Lopez         | Disponible         |"
			Escribir "| 3    | Nicolas Gutierrez  | Disponible         |"
			Escribir "+------+--------------------+--------------------+------------+"
			
			Escribir ""
			Escribir "Ingrese ID numerico del trabajador a asignar (1, 2 o 3): "
			Leer idAsignadoNum
			
			Si idAsignadoNum >= 1 Y idAsignadoNum <= 3 Entonces
				Escribir ""
				Escribir "+----------------------------------------------------------+"
				Escribir "|                     CONFIRMAR ASIGNACION                 |"
				Escribir "+----------------------------------------------------------+"
				Escribir "| Mision  : M0", idMisionNum
				Escribir "| Personal: ", nombreTrabajador[idAsignadoNum], " ", apellidoTrabajador[idAsignadoNum]
				Escribir "+----------------------------------------------------------+"
				
				Repetir
					Escribir "¿CONFIRMAR ASIGNACION DEL TRABAJADOR? (S/N): "
					Leer confirmacion
					confirmacion <- Mayusculas(confirmacion)
				Hasta Que confirmacion = "S" O confirmacion = "N"
				
				Si confirmacion = "S" Entonces
					idTrabajadorAsignado[idMisionNum] <- idAsignadoNum
					Escribir " [OK] Trabajador asignado a la mision M0", idMisionNum
				SiNo
					Escribir " [X] Asignacion cancelada."
				FinSi
			SiNo
				Escribir "[ERROR] ID de trabajador inexistente."
			FinSi
		SiNo
			Escribir "[ERROR] ID de mision inexistente."
		FinSi
	FinSi
FinSubProceso

SubProceso gestionarStock(stock Por Referencia, totalStock Por Referencia)
	Definir opStock, filaMod Como Entero
	Definir nuevaCant, nuevoEstado Como Cadena
	Definir j Como Entero
	
	Repetir
		Borrar Pantalla
		Escribir "--- GESTION DE STOCK E INSUMOS ---"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Escribir "| ID   | Insumo / Recurso        | Categoria    | Cant Actual  | Unidad   | Estado   |"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		
		Para j <- 1 Hasta totalStock Hacer
			Escribir "| ", stock[j, 1], " | ", stock[j, 2], " | ", stock[j, 3], " | ", stock[j, 4], " | ", stock[j, 5], " | ", stock[j, 6], " |"
		FinPara
		
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Escribir ""
		Escribir "[1] Modificar cantidad y estado de un insumo"
		Escribir "[2] Agregar un nuevo insumo"
		Escribir "[3] Volver al menu del coordinador"
		Escribir "Seleccione una opcion: "
		Leer opStock
		
		Segun opStock Hacer
			1:
				Escribir ""
				Escribir "Ingrese el numero de fila del insumo a modificar (1 al ", totalStock, "): "
				Leer filaMod
				Si filaMod >= 1 Y filaMod <= totalStock Entonces
					Escribir "Insumo seleccionado: ", stock[filaMod, 2]
					Escribir "Ingrese la nueva cantidad actual: "
					Leer nuevaCant
					stock[filaMod, 4] <- nuevaCant
					
					Escribir "Ingrese el nuevo estado (Optimo / Bajo / Critico): "
					Leer nuevoEstado
					stock[filaMod, 6] <- nuevoEstado
					
					Escribir "[OK] Stock actualizado correctamente."
				SiNo
					Escribir "[ERROR] Numero de fila invalido."
				FinSi
				Esperar Tecla
			2:
				Si totalStock < 10 Entonces
					totalStock <- totalStock + 1
					Escribir ""
					Escribir "--- AGREGAR NUEVO INSUMO ---"
					stock[totalStock, 1] <- Concatenar("S0", ConvertirATexto(totalStock))
					Escribir "Ingrese Nombre del Insumo: "
					Leer stock[totalStock, 2]
					Escribir "Ingrese Categoria: "
					Leer stock[totalStock, 3]
					Escribir "Ingrese Cantidad: "
					Leer stock[totalStock, 4]
					Escribir "Ingrese Unidad de medida: "
					Leer stock[totalStock, 5]
					Escribir "Ingrese Estado (Optimo/Bajo/Critico): "
					Leer stock[totalStock, 6]
					
					Escribir "[OK] Nuevo insumo agregado exitosamente."
				SiNo
					Escribir "[ERROR] Se alcanzo el limite maximo de la matriz de stock."
				FinSi
				Esperar Tecla
			3:
			De Otro Modo:
				Escribir "Opcion invalida."
				Esperar Tecla
		FinSegun
	Hasta Que opStock = 3
FinSubProceso

SubProceso trabajador(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Referencia, nombreTrabajador Por Referencia, apellidoTrabajador Por Referencia)
	Definir idTrabajadorActual Como Entero
	
	Repetir
		Borrar Pantalla
		Escribir "=========================================================="
		Escribir "                  PANEL DEL TRABAJADOR                    "
		Escribir "=========================================================="
		Escribir "Trabajadores registrados:"
		Escribir ""
		Escribir "1 - ", nombreTrabajador[1], " ", apellidoTrabajador[1]
		Escribir "2 - ", nombreTrabajador[2], " ", apellidoTrabajador[2]
		Escribir "3 - ", nombreTrabajador[3], " ", apellidoTrabajador[3]
		Escribir ""
		Escribir "Ingrese su ID numerico (1, 2, 3 o 0 para salir):"
		Leer idTrabajadorActual
		
		Si idTrabajadorActual <> 0 Y (idTrabajadorActual < 1 O idTrabajadorActual > 3) Entonces
			Escribir "ID incorrecto. Presione Enter para reintentar..."
			Esperar Tecla
		FinSi
		
		Si idTrabajadorActual >= 1 Y idTrabajadorActual <= 3 Entonces
			menuTrabajador(idTrabajadorActual, tipoEmergencia, provincia, localidad, descripcion, nivel, estado, idTrabajadorAsignado, cantMisiones)
		FinSi
		
	Hasta Que idTrabajadorActual = 0  
FinSubProceso

SubProceso menuTrabajador(idTrabajadorActual Por Valor, tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	Definir opcion Como Entero
	
	Repetir
		Borrar Pantalla
		Escribir "=========================================================="
		Escribir "                  PANEL DE TRABAJADOR"
		Escribir "=========================================================="
		Escribir "ID de trabajador activo: T0", idTrabajadorActual
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
				Escribir "Cerrando sesion del trabajador..."
			De Otro Modo:
				Escribir "Opcion incorrecta. Vuelva a intentarlo"
				Esperar Tecla
		FinSegun
	Hasta Que opcion = 4
FinSubProceso

SubProceso verMision(idTrabajadorActual Por Valor, tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia, estado Por Referencia, idTrabajadorAsignado Por Referencia, cantMisiones Por Valor)
	Definir i Como Entero
	Definir encontrada Como Logico
	encontrada <- Falso
	
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                      MISION ASIGNADA                     |"
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
	Escribir "|                      ESTADO DE MISION                    |"
	Escribir "+----------------------------------------------------------+"
	
	Para i <- 1 Hasta cantMisiones Hacer
		Si idTrabajadorAsignado[i] = idTrabajadorActual Entonces
			encontrada <- Verdadero
			Escribir "| Mision       : M0", i
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
	Escribir "|                      CAMBIAR ESTADO                      |"
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

SubProceso VerMisionesPublicas(tipoEmerge Por Referencia, prov Por Referencia, unNivel Por Referencia, totalMisiones Por Valor)
	Definir j Como Entero
	
	Borrar Pantalla
	Escribir "======== MISIONES PUBLICAS DISPONIBLES ========"
	Escribir ""
	
	Si totalMisiones = 0 Entonces
		Escribir "No hay misiones publicas disponibles en este momento."
	SiNo
		Para j <- 1 Hasta totalMisiones Con Paso 1 Hacer
			Escribir "ID Mision : M0", j
			Escribir "Tipo      : ", tipoEmerge[j]
			Escribir "Zona      : ", prov[j]
			Escribir "Urgencia  : ", unNivel[j]
			Escribir "---------------------------------------------"
		FinPara
	FinSi
	Escribir ""
	Escribir "Presione una tecla para volver al menu..."
	Esperar Tecla
FinSubProceso

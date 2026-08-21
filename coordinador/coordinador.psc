Algoritmo coordinador
	Definir opcion, cantMisiones Como Entero
	Definir tipoEmergencia, provincia, localidad, descripcion, confirmacion, nivel Como Cadena
	Dimension tipoEmergencia[20], provincia[20], localidad[20], descripcion[20], nivel[20]
	
	cantMisiones <- 1
	
	Escribir " ================ PANEL DE COORDINADOR ================ "
	Escribir "[1] Crear misión      [2] Misiones Activas      [3] Asignar trabajadores      [4] Ver Stock      [5] Cerrar Sesión "
	Escribir "--------------------------------------------------------------------------------------------------------------------"
	
	Repetir
		Escribir "Seleccione una opción: "
		Leer opcion
		Segun opcion Hacer
			1:
				Si cantMisiones <= 20 Entonces
					crearMision(tipoEmergencia, provincia, localidad, descripcion, nivel, cantMisiones)
					Si tipoEmergencia[cantMisiones] <> "" Entonces
						cantMisiones <- cantMisiones + 1
					FinSi
				SiNo
					Escribir "Limites de misiones alcanzados"
				FinSi
			2:
				mostrarMisionesActivas(tipoEmergencia, provincia, nivel, cantMisiones)
			3:
				Escribir "Asignar trabajadores"
			4:
				Escribir "Ver Stock"
			5:
				Escribir "Cerrar Sesión"
			De Otro Modo:
				Escribir "Opción Incorrecta. Ingrese un número válido: "
		FinSegun
	Hasta Que opcion = 5
FinAlgoritmo

// ======================================= Función donde se crea una misión
SubProceso crearMision(tipoEmerge Por Referencia, prov Por Referencia, local Por Referencia, descrip Por Referencia, unNivel Por Referencia, i Por Valor)
	Definir confirmacion Como Cadena
	
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
	
	// Mostrar vista prev
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
	
	// pide confirmación despues
	Escribir "¿CONFIRMAR CREACION DE LA MISION? (S/N): "
	Leer confirmacion
	
	Si Mayusculas(confirmacion) = "S" Entonces
		Escribir "----------------------------------------------------------"
		Escribir "  [OK] MISION REGISTRADA EXITOSAMENTE CON ID: M0", i
		Escribir "----------------------------------------------------------"
	SiNo
		Escribir "----------------------------------------------------------"
		Escribir "  [X] MISION CANCELADA. Los datos no se guardaron."
		Escribir "----------------------------------------------------------"
		// llimpiamos la posicion si decide no guardar
		tipoEmerge[i] <- ""
		prov[i] <- ""
		local[i] <- ""
		descrip[i] <- ""
		unNivel[i] <- ""
	FinSi
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

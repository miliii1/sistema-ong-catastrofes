SubProceso crearMision(tipoEmergencia Por Referencia, provincia Por Referencia, localidad Por Referencia, descripcion Por Referencia, nivel Por Referencia)
	Escribir "Tipo de emergencia: "
	Leer tipoEmergencia
	Escribir "Zona / Provincia: "
	Leer provincia
	Escribir "Localidad / Area: "
	Leer localidad
	Escribir "Descripción: "
	Leer descripcion
	Escribir "Nivel de urgencia [1] BAJA   [2] MEDIA   [3] ALTA "
	Leer nivel
FinSubProceso

Algoritmo coordinador
	Definir opcion, nivel Como Entero
	Definir tipoEmergencia, provincia, localidad, descripcion Como Cadena
	Dimension tipoEmergencia[20], provincia[20], localidad[20], descripcion[20], nivel[20]
	Definir cantMisiones Como Entero
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
					crearMision(tipoEmergencia[cantMisiones], provincia[cantMisiones], localidad[cantMisiones], descripcion[cantMisiones], nivel[cantMisiones])
					cantMisiones <- cantMisiones + 1
				SiNo
					Escribir "Limites de misiones alcanzados"
				FinSi
			2:
				Escribir "Misiones Activas"
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

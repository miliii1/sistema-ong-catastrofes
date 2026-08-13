SubProceso crearMision
	Definir tipoEmergencia, provincia, localidad, descripcion Como Cadena
	Definir nivel Como Entero
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
	Definir opcion Como Entero
	Escribir " ================ PANEL DE COORDINADOR ================ "
	Escribir "[1] Crear misión      [2] Misiones Activas      [3] Asignar trabajadores      [4] Ver Stock      [5] Cerrar Sesión "
	Escribir "--------------------------------------------------------------------------------------------------------------------"
	Repetir
		Escribir "Seleccione una opción: "
		Leer opcion
		Segun opcion Hacer
			1:
				crearMision()
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

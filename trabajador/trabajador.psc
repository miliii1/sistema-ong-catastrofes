SubProceso verMision
	Definir tipoEmergencia, provincia, localidad, descripcion Como Cadena
	Definir nivel Como Entero
	Escribir ""
	Escribir "================ MISION ASIGNADA ================"
	Escribir "Tipo de emergencia: "//, tipoEmergencia
	Escribir "Provincia: "//, provincia
	Escribir "Localidad / Area: "//, localidad
	Escribir "Descripción: "//, descripcion
	Escribir "Nivel de urgencia: "//, nivel
	
	Escribir "=================================================="
	Escribir "Presione Enter para continuar..."
	Esperar Tecla 
FinSubProceso

SubProceso verEstado
	Definir estado Como Cadena
	Escribir ""
	Escribir "================ ESTADO DE MISION ================="
	Escribir "Estado actual: "//, estado
	Escribir "==================================================="
	Escribir "Presione Enter para continuar..."
	Esperar Tecla 
FinSubProceso

SubProceso  cambiarEstado
	Definir opcEstado Como Entero
	
	Escribir ""
	Escribir "================ CAMBIAR ESTADO ================"
	Escribir "[1] En camino"
	Escribir "[2] En curso"
	Escribir "[3] Controlada"
	Escribir "[4] Volver"
	Escribir "-------------------------------------------------"
	Escribir "Seleccione un estado: "
	Leer opcEstado
	Segun opcEstado Hacer
		1:
			Escribir "Estado actualizado: EN CAMINO"
		2:
			Escribir "Estado actualizado: EN CURSO"
		3:
			Escribir "Estado actualizado: CONTROLADA"
		4:
			Escribir "Volviendo al menú principal..."
			Escribir ""
			Esperar 2 Segundos 
		De Otro Modo:
			Escribir "Opción incorrecta."
	FinSegun
	Escribir "Presione Enter para continuar..."
	Esperar Tecla 
FinSubProceso

Algoritmo trabajador
	Definir opc Como Entero
	
	Repetir
		Limpiar Pantalla
		Escribir " ================ PANEL DE TRABAJADOR =============== "
		Escribir "[1] Ver misión asignada      [2] Ver estado"
		Escribir "[3] Cambiar estado           [4] Cerrar Sesión"
		Escribir "-----------------------------------------------------"
		Escribir ""
		Escribir "Seleccione una opción: "
		Leer opc
		Segun opc Hacer
			1:
				verMision()
			2:
				verEstado()
			3:
				cambiarEstado()
			4:
				Escribir "Cerrando sesión..."
				
			De Otro Modo:
				Escribir "Opción incorrecta. Ingrese un número válido."
		FinSegun
	Hasta Que opc = 4

FinAlgoritmo
Algoritmo ProgramaCompleto
	// ==========================================================
	// 			DEFINICION E INICIALIZACION DE VARIABLES   
	// ==========================================================
	Definir cantidadMisiones, cantidadTrabajadores, cantidadTrabajadoresPorMision Como Entero
	Definir maximoMisiones, maximoTrabajadores, maximoTrabajadoresPorMision, maximoAdministradores Como Entero
	Definir misiones, trabajadores, trabajadoresPorMision, administradores Como Cadena
	Definir cantidadDatosMision, cantidadDatosTrabajador, cantidadDatosAdministrador como Entero
	
	cantidadMisiones <- 0
	cantidadTrabajadores <- 0
	maximoMisiones <- 20
	maximoTrabajadores <- 40
	maximoAdministradores <- 20
	maximoTrabajadoresPorMision <- 5
	cantidadDatosMision <- 7
	cantidadDatosTrabajador <- 3
	cantidadDatosAdministrador <- 5
	
	Dimension misiones[maximoMisiones, cantidadDatosMision]
	Dimension trabajadores[maximoTrabajadores, cantidadDatosTrabajador]
	Dimension administradores[maximoAdministradores,cantidadDatosAdministrador]
	// La fila representa la misión y las columnas los trabajadores asignados
	Dimension trabajadoresPorMision[maximoMisiones, maximoTrabajadoresPorMision]
	Dimension cantidadTrabajadoresPorMision[maximoMisiones]
	Definir num Como Entero
	
	
	//=============================================
	// 			CARGAR BASE DE DATOS
	//=============================================
	cargarBaseDatos(misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores)
	
	
	Repetir 
		Borrar Pantalla
		Escribir "Proyecto RAIZ creado por: Nicolas Arumay, Milagros Gonzalez Jara, Lautaro Pizarro, Maximo Iwanoff"
		Escribir "=========================================================="
		Escribir "                   ONG - CATASTROFRES                     "
		Escribir "=========================================================="
		Escribir "Bienvenido al sistema..." 
		Escribir ""
		Escribir " [1] Administrador" 
		Escribir " [2] Coordinador" 
		Escribir " [3] Trabajador" 
		Escribir " [4] Colaborador" 
		Escribir "" 
		Escribir " [5] Salir del sistema" 
		Escribir "" 
		Escribir "----------------------------------------------------------"
		Escribir "Seleccione su perfil [1-4]: "
		Leer num
		Segun num Hacer
			1:
				administrador(misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores, administradores)
			2:
				coordinador(misiones, cantidadMisiones, trabajadoresPorMision, cantidadTrabajadoresPorMision, maximoMisiones, trabajadores, cantidadTrabajadores) 
			3:
				trabajador(misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores, cantidadTrabajadoresPorMision)
			4:
				colaborador(misiones, cantidadMisiones)
			5:
				Borrar Pantalla 
				Escribir "" 
				Escribir "==========================================================" 
				Escribir "                   CERRANDO EL SISTEMA                    " 
				Escribir "==========================================================" 
				Escribir "" 
				Escribir "Gracias por utilizar nuestro proyecto RAIZ." 
				Escribir ""
			De Otro Modo:
				Limpiar Pantalla
				Escribir ""
				Escribir "[ERROR] La opcion ingresada no es valida." 
				Escribir "Seleccione una opcion entre 1 y 4." 
				Escribir "" 
				Escribir "Presione una tecla para continuar..." 
				Esperar Tecla
				
		Fin Segun
		
	Hasta Que num=5
	
	
	
FinAlgoritmo
// ==========================================================
//                        TRABAJADOR
// ==========================================================
SubProceso trabajador (misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones Por Referencia, cantidadTrabajadores Por Referencia, cantidadTrabajadoresPorMision Por Referencia)
	
	Definir i, j, indiceMisionAsignada Como Entero
	Definir idTrabajador como cadena	
	Definir valido Como Logico
	
	//==========================================================
	//          INGRESO Y SELECCION DEL TRABAJADOR
	//==========================================================
	Repetir
		Limpiar Pantalla
		mostrarTrabajadoresDisponibles(trabajadores, cantidadTrabajadores, idTrabajador)
		
		Si cantidadTrabajadores <> 0 Entonces
			// Solicita y valida el ID del trabajador
			Si ingresarIdTrabajador(IdTrabajador, cantidadTrabajadores) Entonces
				
				// Busca la misión asignada al trabajador seleccionado
				buscarMisionTrabajador(cantidadMisiones, cantidadTrabajadoresPorMision, idTrabajador, trabajadoresPorMision, indiceMisionAsignada)
				
				// Inicia el panel correspondiente al trabajador
				menuTrabajador(misiones, trabajadores, idTrabajador, indiceMisionAsignada, cantidadTrabajadores)
			FinSi
		FinSi
		Limpiar Pantalla
		Escribir ""
		Escribir "Saliendo al menu... "
		Escribir ""
		Esperar 2 segundos
	Hasta Que idTrabajador = "0"  
FinSubProceso 

SubProceso mostrarTrabajadoresDisponibles(trabajadores, cantidadTrabajadores, idTrabajador Por Referencia)
	
	Definir i,j Como Entero
	
	Escribir ""
	Escribir "=========================================================="
	Escribir "                  PANEL DEL TRABAJADOR                    "
	Escribir "=========================================================="
	Escribir ""
	Si cantidadTrabajadores = 0 Entonces
		
		Escribir "No existen trabajadores cargados en el sistema."
		Escribir ""
		Escribir "Presione 0 para salir del sistema..."
		Leer idTrabajador
		
	SiNo
		Escribir "Trabajadores disponibles:"
		Escribir ""
		Para i<-1 Hasta cantidadTrabajadores Con Paso 1 Hacer
			Para j<-0 Hasta 2 Con Paso 1 Hacer
				Escribir Sin Saltar trabajadores[i, j] 
				Si j=0 Entonces
					Escribir Sin Saltar " - "
				SiNo
					Escribir Sin Saltar  " "
				FinSi
			FinPara
			Escribir  " "
		FinPara
		Escribir ""
		Escribir "Presione 0 para salir"
	FinSi
FinSubProceso

SubProceso valido <- ingresarIdTrabajador (idTrabajador por Referencia, cantidadTrabajadores)
	
	Definir valido Como Logico
	Escribir "Ingrese su ID de trabajador (ej: T01):"
	Leer idTrabajador
	Limpiar Pantalla
	
	valido <- validarIdTrabajador(idTrabajador, cantidadTrabajadores)
	
FinSubProceso

Funcion valido <- validarIdTrabajador(idTrabajador, cantTrabajadores)
	
	Definir valido Como Logico
	valido <- Falso
	Si idTrabajador <> "0" Entonces
		Si (Longitud(idTrabajador) <> 3) Entonces
			Escribir ""
			Escribir "[ERROR] Ese formato de ID no existe en el sistema"
			Escribir ""
			Escribir "Presione cualquier tecla para continuar..."
			Esperar Tecla
		SiNo
			Si Subcadena(idTrabajador,0,0) <> "T" Entonces
				Escribir ""
				Escribir "[ERROR] El ID debe comenzar con T"
				Escribir ""
				Escribir "Presione cualquier tecla para continuar..."
				Esperar Tecla
			SiNo
				Si ConvertirANumero(Subcadena(idTrabajador,1,2)) < 1 O ConvertirANumero(Subcadena(idTrabajador,1,2)) > cantTrabajadores Entonces
					Escribir ""
					Escribir "[ERROR] Ese trabajador no existe en el sistema"
					Escribir ""
					Escribir "Presione cualquier tecla para continuar..."
					Esperar Tecla
				SiNo
					valido <- Verdadero
				FinSi
			FinSi
		FinSi
	FinSi
FinFuncion

SubProceso buscarMisionTrabajador (cantidadMisiones, cantidadTrabajadoresPorMision, idTrabajador, trabajadoresPorMision, indiceMisionAsignada Por Referencia)
	
	indiceMisionAsignada <- 0
	Definir  i, j como entero
	Para i<-1 Hasta cantidadMisiones Con paso 1 Hacer
		Para j<-0 Hasta cantidadTrabajadoresPorMision[i]-1 Con Paso 1 Hacer
			Si idTrabajador = trabajadoresPorMision[i, j] Entonces
				indiceMisionAsignada <- i
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso menuTrabajador(misiones, trabajadores, idTrabajador, indiceMisionAsignada, cantidadTrabajadores)
	
	Definir numTrabajador, i, opcion Como Entero
	Para i<-1 Hasta cantidadTrabajadores Con Paso 1 Hacer
		Si idTrabajador = trabajadores[i,0] Entonces
			numTrabajador <- i
		FinSi
	FinPara
	Limpiar Pantalla
	Repetir
		Escribir ""
		Escribir "=========================================================="
		Escribir "                 MENU DEL TRABAJADOR"
		Escribir "=========================================================="
		Escribir "ID: ", idTrabajador
		Escribir "Bienvenido ", trabajadores[numTrabajador, 1], " ", trabajadores[numTrabajador, 2]
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
				verMision(misiones, indiceMisionAsignada)
			2:
				verEstado(misiones, indiceMisionAsignada)
			3:
				cambiarEstado(misiones, indiceMisionAsignada)
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

SubProceso verMision(misiones, misionActual)
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    MISION ASIGNADA                       |"
	Escribir "+----------------------------------------------------------+"
	
	Si misionActual <> 0 Entonces
		Escribir "| ID Mision    : ", misiones[misionActual, 0]
		Escribir "| Tipo         : ", misiones[misionActual, 1]
		Escribir "| Provincia    : ", misiones[misionActual, 2]
		Escribir "| Localidad    : ", misiones[misionActual, 3]
		Escribir "| Descripcion  : ", misiones[misionActual, 4]
		Escribir "| Nivel        : ", misiones[misionActual, 5]
		Escribir "+----------------------------------------------------------+"
	Sino
		Escribir "Este trabajador no tiene ninguna mision asignada"
	FinSi
	
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

SubProceso verEstado(misiones, misionActual)
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    ESTADO DE MISION                      |"
	Escribir "+----------------------------------------------------------+"
	Si misionActual <> 0 Entonces
		Escribir "| Mision: ", misiones[misionActual, 0]
		Escribir "| Estado actual: ", misiones[misionActual, 6]
		Escribir "+----------------------------------------------------------+"
	Sino
		Escribir "Este trabajador no tiene ninguna mision asignada"
	FinSi
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

SubProceso cambiarEstado(misiones, misionActual)
	
	Definir opcionEstado Como Entero
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    CAMBIAR ESTADO                        |"
	Escribir "+----------------------------------------------------------+"
	
	Si misionActual <> 0 Entonces
		Escribir "| Mision: ", misiones[misionActual, 0]
		Escribir "| Estado actual: ", misiones[misionActual, 6]
		Escribir ""
		Si misiones[misionActual,6] = "Controlada" Entonces
			Escribir "La mision ya se encuentra controlada."
			Escribir "No es posible modificar su estado."
			Escribir "----------------------------------------------------------"
		Sino
			
			Escribir "[1] En camino"
			Escribir "[2] En curso"
			Escribir "[3] Controlada"
			Escribir "[4] Volver"
			Escribir "----------------------------------------------------------"
			Escribir "Seleccione una opcion: "
			Leer opcionEstado
			
			Segun opcionEstado Hacer
				
				1:
					Si misiones[misionActual,6] = "En camino" Entonces
						Escribir "La mision ya se encuentra en camino."
					SiNo
						Si misiones[misionActual,6] = "En curso" O misiones[misionActual,6] = "Controlada" Entonces
							Escribir "No se puede volver al estado En camino."
						FinSi
					FinSi
					
				2:
					Si misiones[misionActual,6] = "En camino" Entonces
						misiones[misionActual,6] <- "En curso"
					SiNo
						Si misiones[misionActual,6] = "En curso" Entonces
							Escribir "La mision ya se encuentra En curso."
						SiNo
							Escribir "No se puede pasar una mision Controlada a En curso."
						FinSi
					FinSi
					
				3:
					Si misiones[misionActual,6] = "En curso" Entonces
						misiones[misionActual,6] <- "Controlada"
					SiNo
						Escribir "La mision debe estar En curso antes de ser Controlada."
					FinSi
					
				4:
					Limpiar Pantalla
					Escribir ""
					Escribir "Volviendo..."
					
				De Otro Modo:
					Escribir "Opcion incorrecta."
					
			FinSegun
		FinSi
	Sino
		Escribir "Este trabajador no tiene ninguna mision asignada"
	FinSi
	Escribir ""
	Escribir "Precione cualquier tecla para continuar"
	Esperar Tecla
	Limpiar Pantalla
	
FinSubProceso


// ==========================================================
//                  BASE DE DATOS FALSA
// ==========================================================

SubProceso cargarBaseDatos (misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones Por Referencia, cantidadTrabajadores Por Referencia)
	// Inicializar contadores
	
	// MISIÓN  N°1
	cantidadMisiones <- cantidadMisiones + 1
	
	misiones[1,0] <- "M01"
	misiones[1,1] <- "Inundacion"
	misiones[1,2] <- "Buenos Aires"
	misiones[1,3] <- "La Matanza"
	misiones[1,4] <- "Asistencia a familias afectadas"
	misiones[1,5] <- "ALTA"
	misiones[1,6] <- "En camino"
	
	// Trabajadores asignados a M01
	trabajadoresPorMision[1,0] <- "T01"
	trabajadoresPorMision[1,1] <- "T02"
	
	cantidadTrabajadoresPorMision[1] <- 2
	
	// MISIÓN  N°2
	cantidadMisiones <- cantidadMisiones + 1
	
	misiones[2,0] <- "M02"
	misiones[2,1] <- "Incendio"
	misiones[2,2] <- "Cordoba"
	misiones[2,3] <- "Villa Carlos Paz"
	misiones[2,4] <- "Evacuacion y entrega de suministros"
	misiones[2,5] <- "MEDIA"
	misiones[2,6] <- "En camino"
	
	// Trabajador asignado a M02
	trabajadoresPorMision[2,0] <- "T03"
	
	cantidadTrabajadoresPorMision[2] <- 1
	
	//TRABAJADOR N°1
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[1,0] <- "T01" 
	trabajadores[1,1] <- "Matias" 
	trabajadores[1,2] <- "Perez"
	
	//TRABAJADOR N°2 
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[2,0] <- "T02" 
	trabajadores[2,1] <- "Juan" 
	trabajadores[2,2] <- "Lopez"
	
	//TRABAJADOR N°3 
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[3,0] <- "T03" 
	trabajadores[3,1] <- "Nicolas" 
	trabajadores[3,2] <- "Gutierrez"
	
	//TRABAJADOR N°4
	cantidadTrabajadores <- cantidadTrabajadores + 1 
	
	trabajadores[4,0] <- "T04" 
	trabajadores[4,1] <- "Lautaro" 
	trabajadores[4,2] <- "Diaz"
FinSubProceso


// ==========================================================
//                        ADMINISTRADOR
// ==========================================================

SubProceso administrador(misiones, trabajadores, trabajadoresAsignados, cantTrabajadoresAsignados, cantMisiones Por Referencia, cantTrabajadores Por Referencia, administradores)
	
	Definir opcion Como Entero
	Definir id, asegurar Como Logico
	
	administradores[1,1] <- "1001"
	administradores[1,2] <- "jesucristonuestrosalvador"
	administradores[1,3] <- "Martin"
	administradores[1,4] <- "Rodriguez"
	
	administradores[2,1] <- "1002"
	administradores[2,2] <- "cristoestacontigo"
	administradores[2,3] <- "Sofia"
	administradores[2,4] <- "Fernandez"
	
	administradores[3,1] <- "1003"
	administradores[3,2] <- "pablo"
	administradores[3,3] <- "Lucas"
	administradores[3,4] <- "Gonzalez"
	
	Limpiar Pantalla
	
	Verificacion(administradores, id, asegurar)
	
	Si (asegurar=Verdadero) Entonces
		
		Repetir
			
			Limpiar Pantalla
			
			Escribir "======================================"
			Escribir "          ADMINISTRADORES"
			Escribir "======================================"
			Escribir "1. Agregar trabajador"
			Escribir "2. Quitar trabajador"
			Escribir "3. Quitar mision"
			Escribir "5. Salir"
			Escribir "======================================"
			Escribir "Ingrese una opcion: "
			Leer opcion
			
			Segun opcion Hacer
				
				1:
					AgregarTrabajador(misiones, trabajadores, cantTrabajadoresAsignados, trabajadoresAsignados, cantMisiones, cantTrabajadores)
				2:
					EliminarTrabajadores(misiones, trabajadores, cantTrabajadoresAsignados, trabajadoresAsignados, cantMisiones,cantTrabajadores)
				3:
					
				5:
					Escribir "Saliendo del menu..."
					
				De Otro Modo:
					Escribir "Opcion invalida."
					
			FinSegun
			
			Si opcion <> 5 Entonces
				Escribir ""
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
			FinSi
		Hasta Que opcion = 5
		
	FinSi
FinSubProceso
SubProceso Verificacion(administradores, id Por Referencia, asegurar Por Referencia)
	
	Definir i, j, intentos Como Entero
	Definir verif, contra Como Caracter
	
	id <- Falso
	asegurar <- Falso
	intentos <- 0
	
	Repetir
		
		Escribir "Ingrese su id"
		Leer verif
		
		Para i <- 1 Hasta 3 Con Paso 1 Hacer
			
			Si administradores[i,1] = verif Entonces
				id <- Verdadero
			FinSi
			
		FinPara
		
		Si id <> Verdadero Entonces
			intentos <- intentos + 1
		FinSi
		
	Hasta Que intentos=5 O id=Verdadero
	
	
	Si intentos<>5 Y id<>Falso Entonces
		
		intentos <- 0
		
		Repetir
			
			Escribir "Ingrese su contraseña"
			Leer contra
			
			Para i <- 1 Hasta 3 Con Paso 1 Hacer
				
				Si administradores[i,2] = contra Entonces
					asegurar <- Verdadero
				FinSi
				
			FinPara
			
			Si asegurar <> Verdadero Entonces
				intentos <- intentos + 1
			FinSi
			
		Hasta Que intentos=5 O asegurar=Verdadero
		
	FinSi
	
FinSubProceso


SubProceso AgregarTrabajador(misiones, trabajadores, cantTrabajadoresAsignados, trabajadoresAsignados, cantMisiones Por Referencia, cantTrabajadores Por Referencia)
	Definir verif,asegurar,nombyap Como Caracter
	definir i,pos,j  Como Entero
	Definir numeroNuevoTrabajador Como Entero
	
	numeroNuevoTrabajador <- 0
	Escribir "+----------------------------------------------------------+"
	Escribir "|                      TRABAJADORES                        |"
	Escribir "+----------------------------------------------------------+"
	Escribir ""
	Repetir
		Escribir "Quieres ver los trabajadores actuales? S/N"
		leer verif
		verif<-Mayusculas(verif)
		si(verif<>"S" y verif<>"N") Entonces
			Repetir
				Escribir "No ingreso la opcion correcta, vuelvalo a hacer"
				leer verif
				verif<-mayusculas(verif)
			Hasta Que verif="S" o verif="N"
		FinSi
		si (verif="S") Entonces
			Para i<-1 hasta cantTrabajadores con paso 1 hacer
				Escribir "Trabajador numero ",i,"°"
				Para j<-0 hasta 2 con paso 1 hacer
					Escribir trabajadores[i,j]
				FinPara
			FinPara
		FinSi
		Escribir "Quiere agregar un nuevo trabajador? S/N"
		leer asegurar
		asegurar<-mayusculas(asegurar)
		si(asegurar<>"S" y asegurar<>"N") Entonces
			Repetir
				Escribir "No ingreso la opcion correcta, vuelvalo a hacer"
				leer asegurar
				asegurar<-mayusculas(asegurar)
			Hasta Que asegurar="S" o asegurar="N"
		FinSi
		si(asegurar<>"N") Entonces
			
			Si cantTrabajadores = 0 Entonces
				trabajadores[1,0] <- "T01"
				numeroNuevoTrabajador <- numeroNuevoTrabajador + 1
				Escribir "Ingrese su nombre y apellido del ID ",trabajadores[numeroNuevoTrabajador,0]
				leer nombyap
			Sino
				
				numeroNuevoTrabajador <- ConvertirANumero(Subcadena(trabajadores[cantTrabajadores,0], 1, Longitud(trabajadores[cantTrabajadores,0])-1))
				numeroNuevoTrabajador <- numeroNuevoTrabajador + 1
			Si numeroNuevoTrabajador < 10 Entonces
				trabajadores[numeroNuevoTrabajador,0] <- "T0" + ConvertirATexto(numeroNuevoTrabajador)
			SiNo
				trabajadores(cantTrabajadores,0) <- "T" + ConvertirATexto(numeroNuevoTrabajador)
			FinSi
			Escribir "Ingrese su nombre y apellido del ID ",trabajadores[numeroNuevoTrabajador,0], ": "
			leer nombyap
		FinSi
			Para i <- 1 Hasta Longitud(nombyap) Hacer
				Si Subcadena(nombyap,i,i) = " " Entonces
					pos <- i
				FinSi
			FinPara
			trabajadores[numeroNuevoTrabajador,1] <- Subcadena(nombyap,0,pos-1)
			trabajadores[numeroNuevoTrabajador,2] <- Subcadena(nombyap,pos+1,Longitud(nombyap))
			Escribir trabajadores[numeroNuevoTrabajador,0]
			Escribir trabajadores[numeroNuevoTrabajador,1]
			Escribir trabajadores[numeroNuevoTrabajador,2]
			cantTrabajadores <- cantTrabajadores + 1
		FinSi
	Hasta Que asegurar="N"
FinSubProceso

SubProceso EliminarTrabajadores(misiones, trabajadores, cantTrabajadoresAsignados, trabajadoresAsignados, cantMisiones Por Referencia, cantTrabajadores Por Referencia)
	Definir verif,asegurar,pos1 Como Caracter
	definir i,j,temp,pos Como Entero
	Repetir
		menu(trabajadores,cantTrabajadores)
		Escribir "Quiere eliminar a un trabajador? S/N"
		leer asegurar
		asegurar<-mayusculas(asegurar)
		si(asegurar<>"S" y asegurar<>"N") entonces
			Repetir
				Escribir "No ingreso la opcion correcta, vuelvalo a hacer"
				leer asegurar
				asegurar<-mayusculas(asegurar)
			Hasta Que asegurar="S" o asegurar="N"
		FinSi
		si asegurar<>"N" entonces
			si cantTrabajadores<>0 Entonces
				Escribir "Ingrese la id del trabajador que desea eliminar"
				Leer pos1
				pos <- ConvertirANumero(Subcadena(pos1, 2, Longitud(pos1)))
				Para i <- 1 Hasta cantTrabajadores Hacer
					Si trabajadores(i,0) = pos1 Entonces
						pos <- i
					FinSi
				FinPara
				Si pos <> 0 Entonces
					Para i <- pos Hasta cantTrabajadores-1 Hacer
						Para j <- 0 Hasta 2 Hacer
							trabajadores(i,j) <- trabajadores(i+1,j)
						FinPara
					FinPara
					Para i <- pos Hasta cantTrabajadores-1 Hacer
						temp <- ConvertirANumero(Subcadena(trabajadores(i,0), 2, Longitud(trabajadores(i,0))))
						Si temp < 10 Entonces
							trabajadores(i,0) <- "T0" + ConvertirATexto(temp-1)
						SiNo
							trabajadores(i,0) <- "T" + ConvertirATexto(temp-1)
						FinSi
					FinPara
					Para j <- 0 Hasta 2 Hacer
						trabajadores(cantTrabajadores,j) <- ""
					FinPara
					cantTrabajadores <- cantTrabajadores-1
				FinSi
			SiNo
				Escribir "No hay ningun trabajador actualmente."
				Escribir "Presione una tecla"
				Esperar Tecla
				asegurar <- "N"
				Borrar Pantalla
			FinSi
		FinSi
	Hasta Que asegurar="N"
FinSubProceso

SubProceso menu(trabajadores,cantTrabajadores)
	Definir verif Como Caracter
	Definir i, j Como Entero
	Escribir "+----------------------------------------------------------+"
	Escribir "|                      TRABAJADORES                        |"
	Escribir "+----------------------------------------------------------+"
	Escribir ""
	Repetir
		Escribir "Quieres ver los trabajadores actuales? S/N"
		leer verif
		verif<-Mayusculas(verif)
		si(verif<>"S" y verif<>"N") entonces
			Repetir
				Escribir "No ingreso la opcion correcta, vuelvalo a hacer"
				leer verif
				verif<-mayusculas(verif)
			Hasta Que verif="S" o verif="N"
		FinSi
		si (verif="S") entonces
			Para i<-1 hasta cantTrabajadores con paso 1 hacer
				Escribir "Trabajador numero ",i,"°"
				Para j<-0 hasta 2 con paso 1 hacer
					Escribir trabajadores(i,j)
				FinPara
			FinPara
		FinSi
	hasta que verif="S" o verif="N"
FinSubProceso

// ==========================================================
//                        COORDINADOR
// ==========================================================

SubProceso coordinador (misiones, cantMisiones Por Referencia, trabajadoresPorMision, cantTrabajadoresPorMision, maximoMisiones, trabajadores, cantTrabajadores)
	Definir opcion, i Como Entero
	i <- 0
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
					crearMision(misiones, i, cantMisiones)
			2:
				Borrar Pantalla
				mostrarMisionesActivas(misiones, cantMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menú..."
				Esperar Tecla
			3:
				Borrar Pantalla
				asignarTrabajadores(misiones, cantMisiones, trabajadores, cantTrabajadores, cantTrabajadoresPorMision, trabajadoresPorMision)
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
FinSubProceso

// ======================================= Función donde se crea una misión
SubProceso crearMision(misiones, i, cantMisiones Por referencia)
	Definir confirmacion Como Cadena
	
	//MODIFICAR
	Si i = 0 Entonces
		
		misiones[1,0] <- "M01"
		i<-i+1
		
	Sino
		Si ConvertirANumero(SubCadena(misiones[1,0],1,2)) < 10 Entonces
			i<-ConvertirANumero(SubCadena(misiones[1,0],1,2))
			i<-i+1
			misiones[i,0] <- "M0" + ConvertirATexto(i)
		SiNo
			i<-ConvertirANumero(SubCadena(misiones[1,0],1,2))
			i<-i+1
			misiones[i,0] <- "M" + ConvertirATexto(i)
		FinSi
	FinSi
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
	misiones[i,6] <- "En camino"
	
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
		Escribir "  [OK] MISION REGISTRADA EXITOSAMENTE CON ID: ", misiones[i,0]
		Escribir "----------------------------------------------------------"
		cantMisiones <- cantMisiones + 1
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
		misiones[i, 6] <- ""
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
	
	Si totalMisiones = 0 Entonces
		Escribir "|  --  | No hay misiones activas registradas          |  --         |"
	SiNo
		Para j <- 1 Hasta totalMisiones Con Paso 1 Hacer
			Escribir "| ", misiones[j,0], "  | ", misiones[j, 1], "                     | ", misiones[j, 2], "  |      ", misiones[j, 5], "      |"
		FinPara
	FinSi
	
	Escribir "+------+------------------------------+---------------+-------------+"
FinSubProceso

// ======================================= Función para asignar Trabajador
SubProceso asignarTrabajadores(misiones Por Referencia, totalMisiones Por Valor, trabajadores, cantTrabajadores, cantTrabajadorPorMision, trabajadorPorMision)
	Definir idMision, idTrabajador, confirmacion Como Cadena
	Definir i, j Como Entero
	
	Escribir "--- ASIGNAR TRABAJADORES ---"
	Escribir "Seleccione la misión a la que desea asignar trabajadores:"
	Escribir "+------+-------------------------------+--------------------+----------+"
	Escribir "| ID   | Tipo de emergencia           | Zona               | Urgencia |"
	Escribir "+------+-------------------------------+--------------------+----------+"
	
	Si totalMisiones = 0 Entonces
		Escribir "|  --  | No hay misiones registradas   | --                 | --       |"
		Escribir "+------+-------------------------------+--------------------+----------+"
	SiNo
		Para j <- 1 Hasta totalMisiones Con Paso 1 Hacer
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
		//MODIFICAR
		Para i<-1 Hasta cantTrabajadores Con Paso 1 Hacer
			Para j<-0 Hasta 2 Con Paso 1 Hacer
				Escribir Sin Saltar trabajadores[i, j] 
				Si j=0 Entonces
					Escribir Sin Saltar " - "
				SiNo
					Escribir Sin Saltar  " "
				FinSi
			FinPara
			Escribir  " "
		FinPara
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
			//MODIFICAR
			trabajadorPorMision[ConvertirANumero(idMision),ConvertirANumero(Subcadena(idTrabajador, 1,2))-1] <- idTrabajador
			cantTrabajadorPorMision[ConvertirANumero(idMision)] <- 1
		SiNo
			Escribir " [X] Asignación cancelada."
		FinSi
	FinSi
FinSubProceso

// ======================================= Función para ver stock
SubProceso gestionarStock
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

// ==========================================================
//                        COLABORADOR
// ==========================================================

SubProceso colaborador(matrizMisiones, cantidadMisiones)
	Definir opcion Como Entero
	Escribir "======================================"
	Escribir "          COLABORADORES"
	Escribir "======================================"
	Escribir "1. Ver misiones publicas"
	Escribir ""
	Escribir "2. Salir"
	Escribir "======================================"
	Escribir "Ingrese una opcion: "
	Leer opcion
	
	Segun opcion Hacer
		1:
			verMisionesPublicas(matrizMisiones, cantidadMisiones)
		2:
			Escribir "Saliendo del menu de colaborador..."
		De Otro Modo:
			Escribir "[ERROR] La opcion ingresada no es valida." 
			Escribir "Seleccione una opcion entre 1 y 4." 
			Escribir "" 
			Escribir "Presione una tecla para continuar..." 
			Esperar Tecla
	FinSegun
	
FinSubProceso

Funcion verMisionesPublicas(matrizMisiones, cantidadMisiones)
	Definir i Como Entero
	Definir hayPublicas Como Logico
	
	i <- 1
	hayPublicas <- Falso
	Limpiar Pantalla
	Escribir "========================================"
	Escribir "     MISIONES PUBLICAS DISPONIBLES      "
	Escribir "========================================"
	
	// En base 1, iteramos desde 1 hasta cantidadMisiones
	Para i <- 1 Hasta cantidadMisiones Hacer
		// Columna 3 contiene la Visibilidad ("Publica" / "Privada")
		Si Mayusculas(matrizMisiones[i, 3]) = "PUBLICA" Entonces
			Escribir "ID Mision : ", matrizMisiones[i, 1]
			Escribir "Titulo    : ", matrizMisiones[i, 2]
			Escribir "Estado    : ", matrizMisiones[i, 4]
			Escribir "---------------------------------------------"
			hayPublicas <- Verdadero
		FinSi
	FinPara
	
	Si NO hayPublicas Entonces
		Escribir "No hay misiones publicas disponibles en este momento."
		Escribir "" 
		Escribir "Presione una tecla para continuar..." 
		Esperar Tecla
	FinSi
FinFuncion
	
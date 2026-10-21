Algoritmo ProgramaCompleto
	// ==========================================================
	// 			DEFINICION E INICIALIZACION DE VARIABLES   
	// ==========================================================
	Definir cantidadMisiones, cantidadTrabajadores, cantidadTrabajadoresPorMision Como Entero
	Definir maximoMisiones, maximoTrabajadores, maximoTrabajadoresPorMision, maximoAdministradores, maximoUsuarios Como Entero
	Definir misiones, trabajadores, trabajadoresPorMision, administradores, usuarios Como Caracter
	Definir cantidadDatosMision, cantidadDatosTrabajador, cantidadDatosAdministrador, cantidadDatosUsuarios, cantidadUsuarios, filaUsuario como Entero
	Definir num, totalStock Como Entero
	Definir stock Como Cadena
	
	cantidadMisiones <- 0
	cantidadTrabajadores <- 0
	cantidadUsuarios <- 0
	maximoMisiones <- 20
	maximoUsuarios <- 7
	maximoTrabajadores <- 40
	maximoAdministradores <- 20
	maximoTrabajadoresPorMision <- 5
	cantidadDatosMision <- 7
	cantidadDatosTrabajador <- 3
	cantidadDatosAdministrador <- 5
	cantidadDatosUsuarios <- 3
	totalStock <- 0
	
	Dimension misiones[maximoMisiones, cantidadDatosMision]
	Dimension trabajadores[maximoTrabajadores, cantidadDatosTrabajador]
	Dimension administradores[maximoAdministradores,cantidadDatosAdministrador]
	Dimension usuarios[maximoUsuarios, cantidadDatosUsuarios]
	// La fila representa la misión y las columnas los trabajadores asignados
	Dimension trabajadoresPorMision[maximoMisiones, maximoTrabajadoresPorMision]
	Dimension cantidadTrabajadoresPorMision[maximoMisiones]
	Definir donacionesPorMision, k Como Entero
	Dimension donacionesPorMision[maximoMisiones]
	Para k <- 0 Hasta maximoMisiones - 1 Con Paso 1 Hacer
		donacionesPorMision[k] <- 0
	FinPara
	Dimension stock[11, 7]
	
	
	Definir acumuladoDonaciones Como Entero
	acumuladoDonaciones <- 0
	
	
	//=============================================
	// 			CARGAR BASE DE DATOS
	//=============================================
	cargarBaseDatos(usuarios, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores)
	
	
	Repetir 
		Borrar Pantalla
		Escribir "Proyecto RAIZ creado por: Nicolas Arumay, Milagros Gonzalez Jara, Lautaro Pizarro, Maximo Iwanoff"
		Escribir "=========================================================="
		Escribir "                   ONG - CATASTROFRES                     "
		Escribir "=========================================================="
		Escribir "Bienvenido al sistema..." 
		Escribir ""
		Escribir " [1] Iniciar sesion" 
		Escribir " [2] Salir del sistema" 
		Escribir "" 
		Escribir "----------------------------------------------------------"
		Escribir "Seleccione una opcion [1-2]: "
		Leer num
		Segun num Hacer
			1:
				filaUsuario <- iniciarSesion(usuarios, maximoUsuarios)
				si filaUsuario <> -1 Entonces
					elegirPerfilUsuario(filaUsuario, usuarios, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores, administradores, maximoMisiones, stock, totalStock, acumuladoDonaciones, donacionesPorMision)
				FinSi
			2:
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
				Escribir "Seleccione una opcion entre 1 y 2." 
				Escribir "" 
				Escribir "Presione una tecla para continuar..." 
				Esperar Tecla
				
		Fin Segun
		
	Hasta Que num=2
FinAlgoritmo
// ==========================================================
//                         USUARIOS
// ==========================================================

Funcion posUsuario <- iniciarSesion(usuarios, maxUsuarios)
	
	Definir nombreIngresado, contraseñaIngresada Como Caracter
	Definir maximoIntentos como Entero
	Definir cantidadIntentos, posUsuario Como Entero
	Definir sesionIniciada Como Logico
	
	maximoIntentos <- 5
	cantidadIntentos <- 0
	sesionIniciada <- Falso
	posUsuario <- -1
	
	Repetir
		Limpiar Pantalla
		Escribir "=========================================================="
		Escribir "                   ONG - CATASTROFRES                     "
		Escribir "=========================================================="
		Escribir ""
		Escribir "Ingrese su nombre de usuario: "
		Leer nombreIngresado
		posUsuario <- buscarUsuario(nombreIngresado, usuarios, maxUsuarios)
		Limpiar Pantalla
		Si posUsuario = -1 Entonces 
			
			cantidadIntentos <- cantidadIntentos + 1
			Escribir "=========================================================="
			Escribir "                   ONG - CATASTROFRES                     "
			Escribir "=========================================================="
			Escribir ""
			Escribir "[ERROR] El usuario no existe."
			Si cantidadIntentos <= maximoIntentos Entonces
				Escribir "Intentos restantes: ", maximoIntentos - cantidadIntentos
			FinSi
			Escribir ""
			Escribir "Presiona cualquier tecla para continuar..."
			Esperar Tecla
			Limpiar Pantalla
		SiNo
			Repetir
				Escribir "=========================================================="
				Escribir "                   ONG - CATASTROFRES                     "
				Escribir "=========================================================="
				Escribir ""
				Escribir "Bienvenido usuario ", nombreIngresado
				Escribir ""
				Escribir "Ingrese su contraseña: "
				Leer contraseñaIngresada
				Si	validarContraseña(posUsuario, contraseñaIngresada, usuarios) Entonces
					sesionIniciada <- Verdadero
				Sino
					Limpiar Pantalla
					cantidadIntentos <- cantidadIntentos + 1
					Escribir ""
					Escribir "[ERROR] Contraseña incorrecta."
					Si cantidadIntentos <= maximoIntentos Entonces
						Escribir "Intentos restantes: ", (maximoIntentos - cantidadIntentos)
					FinSi
					Escribir ""
					Escribir "Presiona cualquier tecla para continuar..."
					Esperar Tecla
					Limpiar Pantalla
				FinSi
			Hasta Que cantidadIntentos >= maximoIntentos o sesionIniciada
		FinSi
		
	Hasta Que sesionIniciada o cantidadIntentos = maximoIntentos
	
	Si sesionIniciada Entonces
		Escribir "Bienvenido [",usuarios[posUsuario,0], "] ", usuarios[posUsuario,1]
	SiNo
		Escribir ""
		Escribir "[ERROR] Demasiados intentos fallidos. Vuelve a intentarlo."
		Esperar 2 Segundos
		posUsuario <- -1
	FinSi
	
FinFuncion

Funcion fila <- buscarUsuario (nombreBuscado, usuarios, maxUsuarios)
	Definir i como entero
	Definir fila Como entero
	i <- 0
	fila <- -1 
	
	Mientras i < maxUsuarios y fila = -1 Hacer
		Si	usuarios[i,1] = nombreBuscado Entonces
			fila <- i
		SiNo
			i <- i + 1 
		FinSi
	FinMientras
	
FinFuncion

Funcion esCorrecto <- validarContraseña(posUsuario, contraseña, usuarios)
	Definir i Como Entero
	Definir esCorrecto Como Logico
	
	esCorrecto <- Falso
	
	Si	usuarios[posUsuario, 2] = contraseña Entonces
		esCorrecto <- Verdadero
	FinSi
FinFuncion

SubProceso elegirPerfilUsuario (filaUsuario, usuarios, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones Por Referencia, cantidadTrabajadores Por Referencia, administradores, maximoMisiones, stock, totalStock Por Referencia, acumuladoDonaciones Por Referencia, donacionesPorMision)
	Definir idUsuario, perfilUsuario Como Caracter
	
    // Obtener el ID de la cuenta del usuario
    idUsuario <- usuarios[filaUsuario, 0]
	
    // Extraer la primera letra del ID
    perfilUsuario <- Subcadena(idUsuario, 0, 0)
	
    // Ejecutar el módulo según el rol
    Segun perfilUsuario Hacer
		
        "A":
            administrador(idUsuario, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores, administradores)
			
        "T":
            trabajador(idUsuario, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones, cantidadTrabajadores)
			
        "C":
            coordinador(idUsuario, misiones, cantidadMisiones, trabajadoresPorMision, cantidadTrabajadoresPorMision, maximoMisiones, trabajadores, cantidadTrabajadores, stock, totalStock)
			
        "S":
            colaborador(idUsuario, misiones, cantidadMisiones)
			
        "F":
            finanzas(idUsuario, acumuladoDonaciones, misiones, cantidadMisiones, donacionesPorMision)
			
        De Otro Modo:
            Escribir "Error: el ID no tiene un rol reconocido."
            Esperar Tecla
			
    FinSegun
FinSubProceso

// ==========================================================
//                        TRABAJADOR
// ==========================================================
SubProceso trabajador (idTrabajador, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones Por Referencia, cantidadTrabajadores Por Referencia)
	
	Definir i, j, indiceMisionAsignada Como Entero
	Definir valido Como Logico
	
	//==========================================================
	//          INGRESO Y SELECCION DEL TRABAJADOR
	//==========================================================
	Limpiar Pantalla
	Si cantidadTrabajadores <> 0 Entonces
		// Busca la misión asignada al trabajador seleccionado
		buscarMisionTrabajador(cantidadMisiones, cantidadTrabajadoresPorMision, idTrabajador, trabajadoresPorMision, indiceMisionAsignada)
		
		// Inicia el panel correspondiente al trabajador
		menuTrabajador(misiones, trabajadores, idTrabajador, indiceMisionAsignada, cantidadTrabajadores)
	SiNo
		Escribir ""
		Escribir "=========================================================="
		Escribir "                  PANEL DEL TRABAJADOR                    "
		Escribir "=========================================================="
		Escribir ""
		Escribir "No existen trabajadores cargados en el sistema."
		Escribir ""
		Escribir "Presiona cualquier tecla para continuar"
		Esperar Tecla
	FinSi
	Limpiar Pantalla
	Escribir ""
	Escribir "Saliendo al menu... "
	Escribir ""
	Esperar 2 segundos
FinSubProceso 

SubProceso buscarMisionTrabajador (cantidadMisiones, cantidadTrabajadoresPorMision, idTrabajador, trabajadoresPorMision, indiceMisionAsignada Por Referencia)
	
	indiceMisionAsignada <- 0
	Definir  i, j como entero
	Para i<-1 Hasta cantidadMisiones Con paso 1 Hacer
		Para j<-0 Hasta cantidadTrabajadoresPorMision[i]-1 Con Paso 1 Hacer
			//Escribir "Mision: ", i, " cant trabajadores: ", trabajadoresPorMision[i,j]
			Si idTrabajador = trabajadoresPorMision[i, j] Entonces
				indiceMisionAsignada <- i
			FinSi
		FinPara
	FinPara
FinSubProceso

SubProceso menuTrabajador(misiones, trabajadores, idTrabajador, indiceMisionAsignada Por Referencia, cantidadTrabajadores)
	
	Definir numTrabajador, i, opc Como Entero
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
		Leer opc
		
		Segun opc Hacer
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
		
	Hasta Que opc = 4
	
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
		Escribir misionActual
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

SubProceso cargarBaseDatos (usuarios, misiones, trabajadores, trabajadoresPorMision, cantidadTrabajadoresPorMision, cantidadMisiones Por Referencia, cantidadTrabajadores Por Referencia)
	
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
	
	//N°1 admin
	usuarios[0, 0] <- "T02"
	usuarios[0, 1] <- "N1colas"
	usuarios[0, 2] <- "Pepito_"
	
	//N°2 admin
	usuarios[1, 0] <- "A01"
	usuarios[1, 1] <- "PolloAlvarez"
	usuarios[1, 2] <- "galletita123"
	
	//N°3 admin
	usuarios[2, 0] <- "A02"
	usuarios[2, 1] <- "Jupiter123"
	usuarios[2, 2] <- "planetatierra!"
	
	//N°1 coordinador
	usuarios[3, 0] <- "C01"
	usuarios[3, 1] <- "CoordAnakin"
	usuarios[3, 2] <- "anakin2026"
	
	//N°2 coordinador
	usuarios[4, 0] <- "C02"
	usuarios[4, 1] <- "CoordLeia"
	usuarios[4, 2] <- "leia2026"
	
	//N°3 coordinador
	usuarios[5, 0] <- "C03"
	usuarios[5, 1] <- "CoordLuke"
	usuarios[5, 2] <- "luke2026"
	
	//N°1 finanzas
	usuarios[6, 0] <- "F01"
	usuarios[6, 1] <- "FinanzasAna"
	usuarios[6, 2] <- "ana2026"
FinSubProceso


// ==========================================================
//                        ADMINISTRADOR
// ==========================================================

SubProceso administrador(idUsuario, misiones, trabajadores, trabajadoresAsignados, cantTrabajadoresAsignados, cantMisiones Por Referencia, cantTrabajadores Por Referencia, administradores)
	
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

SubProceso coordinador (idUsuario, misiones, cantMisiones Por Referencia, trabajadoresPorMision, cantTrabajadoresPorMision, maximoMisiones, trabajadores, cantTrabajadores, stock, totalStock Por Referencia)
	Definir opcion Como Entero
	
	Repetir
		Borrar Pantalla 
		Escribir " ================ PANEL DE COORDINADOR ================ "
		Escribir "ID: ", idUsuario
		Escribir ""
		Escribir "[1] Crear mision"
		Escribir "[2] Misiones activas"
		Escribir "[3] Asignar trabajadores"
		Escribir "[4] Ver stock"
		Escribir "[5] Cerrar sesion"
		Escribir "------------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opcion
		
		Segun opcion Hacer
			1:
				Borrar Pantalla
				crearMision(misiones, cantMisiones, maximoMisiones, cantTrabajadoresPorMision)
			2:
				Borrar Pantalla
				mostrarMisionesActivas(misiones, cantMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			3:
				Borrar Pantalla
				asignarTrabajadores(misiones, cantMisiones, trabajadores, cantTrabajadores, cantTrabajadoresPorMision, trabajadoresPorMision)
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			4:
				gestionarStock(stock, totalStock)
			5:
				Borrar Pantalla
				Escribir "Sesion cerrada correctamente."
				Esperar 1 Segundos
			De Otro Modo:
				Escribir "Opcion incorrecta. Ingrese un numero valido."
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
		FinSegun
	Hasta Que opcion = 5
FinSubProceso

// ======================================= Crear mision
SubProceso crearMision(misiones, cantMisiones Por Referencia, maximoMisiones, cantTrabajadoresPorMision)
	Definir confirmacion, urgencia Como Cadena
	Definir i Como Entero
	
	Si cantMisiones + 1 >= maximoMisiones Entonces
		Escribir "[ERROR!] Se alcanzo el maximo de misiones permitidas."
	SiNo
		i <- cantMisiones + 1
		
		Si i < 10 Entonces
			misiones[i,0] <- "M0" + ConvertirATexto(i)
		SiNo
			misiones[i,0] <- "M" + ConvertirATexto(i)
		FinSi
		
		Escribir "--- CREAR NUEVA MISION ---"
		Escribir "ID asignado: ", misiones[i,0]
		Escribir "Tipo de emergencia: "
		Leer misiones[i, 1]
		Escribir "Zona / Provincia: "
		Leer misiones[i, 2]
		Escribir "Localidad / Area: "
		Leer misiones[i, 3]
		Escribir "Descripcion: "
		Leer misiones[i, 4]
		
		// repite hasta que elij una urgencia valida
		Repetir
			Escribir "Nivel de urgencia [1] BAJA   [2] MEDIA   [3] ALTA: "
			Leer urgencia
			Si urgencia = "1" Entonces
				misiones[i,5] <- "BAJA"
			SiNo
				Si urgencia = "2" Entonces
					misiones[i,5] <- "MEDIA"
				SiNo
					Si urgencia = "3" Entonces
						misiones[i,5] <- "ALTA"
					SiNo
						Escribir "[ERROR!] Opcion invalida. Elija 1, 2 o 3."
						urgencia <- ""
					FinSi
				FinSi
			FinSi
		Hasta Que urgencia <> ""
		
		misiones[i,6] <- "En camino"
		
		// Vista previa
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
			Escribir "CONFIRMAR CREACION DE LA MISION? (S/N): "
			Leer confirmacion
			confirmacion <- Mayusculas(confirmacion)
			Si confirmacion <> "S" Y confirmacion <> "N" Entonces
				Escribir "[ERROR] Opcion invalida. Debe ingresar S o N."
			FinSi
		Hasta Que confirmacion = "S" O confirmacion = "N"
		
		Si confirmacion = "S" Entonces
			cantTrabajadoresPorMision[i] <- 0
			cantMisiones <- cantMisiones + 1
			Escribir "----------------------------------------------------------"
			Escribir "  [OK] MISION REGISTRADA CON ID: ", misiones[i,0]
			Escribir "----------------------------------------------------------"
		SiNo
			Escribir "----------------------------------------------------------"
			Escribir "  [X] MISION CANCELADA. Los datos no se guardaron."
			Escribir "----------------------------------------------------------"
			misiones[i,0] <- ""
			misiones[i,1] <- ""
			misiones[i,2] <- ""
			misiones[i,3] <- ""
			misiones[i,4] <- ""
			misiones[i,5] <- ""
			misiones[i,6] <- ""
		FinSi
	FinSi
	
	Escribir ""
	Escribir "Presione una tecla para continuar..."
	Esperar Tecla
FinSubProceso
// ======================================= Función donde se visualizan las misiones
SubProceso mostrarMisionesActivas(misiones, totalMisiones)
	Definir j, activas Como Entero
	activas <- 0
	
	Escribir "--- MISIONES ACTIVAS ---"
	Escribir "----------------------------------------------------------"
	Para j <- 1 Hasta totalMisiones Con Paso 1 Hacer
		Si misiones[j,6] <> "Controlada" Entonces
			Escribir misiones[j,0], " | ", misiones[j,1], " | ", misiones[j,2], " - ", misiones[j,3], " | Urgencia: ", misiones[j,5], " | Estado: ", misiones[j,6]
			activas <- activas + 1
		FinSi
	FinPara
	
	Si activas = 0 Entonces
		Escribir "No hay misiones activas registradas."
	FinSi
	Escribir "----------------------------------------------------------"
FinSubProceso

// ======================================= Asignar trabajadores
SubProceso asignarTrabajadores(misiones, totalMisiones, trabajadores, cantTrabajadores, cantTrabajadorPorMision, trabajadorPorMision)
	Definir idTrabajador, confirmacion, misionOcupada Como Cadena
	Definir idMision, i, j, maxPorMision Como Entero
	Definir existe, yaAsignado Como Logico
	
	maxPorMision <- 5
	
	Escribir "--- ASIGNAR TRABAJADORES ---"
	
	Si totalMisiones = 0 Entonces
		Escribir "No hay misiones registradas."
	SiNo
		Escribir "MISIONES DISPONIBLES:"
		Escribir "----------------------------------------------------------"
		Para j <- 1 Hasta totalMisiones Con Paso 1 Hacer
			Escribir "[", j, "] ", misiones[j,0], " | ", misiones[j,1], " | ", misiones[j,2], " | Urgencia: ", misiones[j,5], " | Trabajadores: ", cantTrabajadorPorMision[j], "/", maxPorMision
		FinPara
		Escribir "----------------------------------------------------------"
		
		// en esta parte valida si existe la mision
		Repetir
			Escribir "Ingrese el numero de la mision (1 al ", totalMisiones, "): "
			Leer idMision
			Si idMision < 1 O idMision > totalMisiones Entonces
				Escribir "[ERROR] Esa mision no existe."
			FinSi
		Hasta Que idMision >= 1 Y idMision <= totalMisiones
		
		// comprueba q la la mision no este llena
		Si cantTrabajadorPorMision[idMision] >= maxPorMision Entonces
			Escribir "[ERROR] La mision ", misiones[idMision,0], " ya tiene el maximo de ", maxPorMision, " trabajadores."
		SiNo
			Escribir ""
			Escribir "LISTA DE TRABAJADORES:"
			Escribir "----------------------------------------------------------"
			Para i <- 1 Hasta cantTrabajadores Con Paso 1 Hacer
				Escribir trabajadores[i,0], " - ", trabajadores[i,1], " ", trabajadores[i,2]
			FinPara
			Escribir "----------------------------------------------------------"
			
			// aca se valida q el trabajador exista
			Repetir
				Escribir "Ingrese ID del trabajador a asignar (ej: T02): "
				Leer idTrabajador
				idTrabajador <- Mayusculas(idTrabajador)
				existe <- Falso
				Para i <- 1 Hasta cantTrabajadores Con Paso 1 Hacer
					Si trabajadores[i,0] = idTrabajador Entonces
						existe <- Verdadero
					FinSi
				FinPara
				Si No existe Entonces
					Escribir "[ERROR] Ese trabajador no existe."
				FinSi
			Hasta Que existe
			
			// comprobamos q no este asignado a otra mision!!
			yaAsignado <- Falso
			Para i <- 1 Hasta totalMisiones Con Paso 1 Hacer
				Para j <- 0 Hasta cantTrabajadorPorMision[i] - 1 Con Paso 1 Hacer
					Si trabajadorPorMision[i,j] = idTrabajador Entonces
						yaAsignado <- Verdadero
						misionOcupada <- misiones[i,0]
					FinSi
				FinPara
			FinPara
			
			Si yaAsignado Entonces
				Escribir "[ERROR] El trabajador ", idTrabajador, " ya esta asignado a la mision ", misionOcupada, "."
			SiNo
				Escribir ""
				Escribir "+----------------------------------------------------------+"
				Escribir "|                   CONFIRMAR ASIGNACION                   |"
				Escribir "+----------------------------------------------------------+"
				Escribir "| Mision  : ", misiones[idMision,0]
				Escribir "| Personal: ", idTrabajador
				Escribir "+----------------------------------------------------------+"
				
				Repetir
					Escribir "CONFIRMAR ASIGNACION DEL TRABAJADOR? (S/N): "
					Leer confirmacion
					confirmacion <- Mayusculas(confirmacion)
					Si confirmacion <> "S" Y confirmacion <> "N" Entonces
						Escribir "[ERROR] Opcion invalida. Debe ingresar S o N."
					FinSi
				Hasta Que confirmacion = "S" O confirmacion = "N"
				
				Si confirmacion = "S" Entonces
					trabajadorPorMision[idMision, cantTrabajadorPorMision[idMision]] <- idTrabajador
					cantTrabajadorPorMision[idMision] <- cantTrabajadorPorMision[idMision] + 1
					Escribir "[OK] Trabajador ", idTrabajador, " asignado a la mision ", misiones[idMision,0]
					Escribir "Ahora la mision tiene ", cantTrabajadorPorMision[idMision], " trabajador(es)."
				SiNo
					Escribir "[X] Asignacion cancelada."
				FinSi
			FinSi
		FinSi
	FinSi
FinSubProceso

// ======================================= Función para ver stock
SubProceso gestionarStock(stock Por Referencia, totalStock Por Referencia)
	Definir opStock, filaMod Como Entero
	Definir nuevaCant, nuevoEstado Como Cadena
	Definir j Como Entero
	
	Si totalStock = 0 Entonces
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
	FinSi
	
	
	Repetir
		Borrar Pantalla
		Escribir "--- GESTIÓN DE STOCK E INSUMOS ---"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Escribir "| ID   | Insumo / Recurso        | Categoria    | Cant Actual  | Unidad   | Estado   |"
		Escribir "+------+-------------------------+--------------+--------------+----------+----------+"
		Para j <- 1 Hasta totalStock Hacer
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
				Escribir "Ingrese el número de la fila del insumo a modificar (1 al ", totalStock,"): "
				Leer filaMod
				Si filaMod >= 1 Y filaMod <= totalStock Entonces
					Escribir "Insumo seleccionado: ", stock[filaMod, 2]
					Escribir "Ingrese la nueva cantidad actual: "
					Leer nuevaCant
					stock[filaMod, 4] <- nuevaCant
					
					Repetir
						Escribir "Ingrese el nuevo estado (Optimo / Bajo / Critico): "
						Leer nuevoEstado
						Si Mayusculas(nuevoEstado) <> "OPTIMO" Y Mayusculas(nuevoEstado) <> "BAJO" Y Mayusculas(nuevoEstado) <> "CRITICO" Entonces
							Escribir "[ERROR] Estado invalido."
						FinSi
					Hasta Que Mayusculas(nuevoEstado) = "OPTIMO" O Mayusculas(nuevoEstado) = "BAJO" O Mayusculas(nuevoEstado) = "CRITICO"
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

SubProceso colaborador(idUsuario, matrizMisiones, cantidadMisiones)
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

// ==========================================================
//                        FINANZAS
// ==========================================================
SubProceso finanzas(idUsuario, acumuladoDonaciones Por Referencia, misiones, cantidadMisiones, donacionesPorMision)
	Definir opFinanzas, monto, cantDistribuir, i, posMision, totalDistribuido Como Entero
	Definir idMisionDestino, confirmacion Como Cadena
	
	Repetir
		Limpiar Pantalla
		Escribir " ================ PANEL DE FINANZAS ================ "
		Escribir "ID: ", idUsuario
		Escribir "Fondos disponibles para distribuir: ", acumuladoDonaciones
		Escribir "-----------------------------------------------------"
		Escribir "[1] Ver estado financiero"
		Escribir "[2] Registrar donacion recibida"
		Escribir "[3] Distribuir fondos a una mision"
		Escribir "[4] Cerrar sesion"
		Escribir "-----------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opFinanzas
		
		Segun opFinanzas Hacer
			1:
				Limpiar Pantalla
				Escribir "--- ESTADO FINANCIERO ACTUAL ---"
				Escribir "Fondos pendientes de distribucion: ", acumuladoDonaciones
				Escribir ""
				Escribir "Fondos asignados por mision:"
				Escribir "-----------------------------------------------------"
				totalDistribuido <- 0
				Si cantidadMisiones = 0 Entonces
					Escribir "No hay misiones registradas."
				SiNo
					Para i <- 1 Hasta cantidadMisiones Con Paso 1 Hacer
						Escribir misiones[i,0], " | ", misiones[i,1], " | ", misiones[i,6], " | Recibido: ", donacionesPorMision[i]
						totalDistribuido <- totalDistribuido + donacionesPorMision[i]
					FinPara
				FinSi
				Escribir "-----------------------------------------------------"
				Escribir "Total ya distribuido: ", totalDistribuido
				Escribir "Total recaudado (distribuido + pendiente): ", totalDistribuido + acumuladoDonaciones
				Escribir ""
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			2:
				Limpiar Pantalla
				Escribir "--- REGISTRAR DONACION ---"
				Escribir "Ingrese el monto recibido: "
				Leer monto
				Si monto > 0 Entonces
					acumuladoDonaciones <- acumuladoDonaciones + monto
					Escribir "[OK] Donacion registrada. Fondos disponibles: ", acumuladoDonaciones
				SiNo
					Escribir "[ERROR!] El monto debe ser mayor a 0."
				FinSi
				Escribir ""
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			3:
				Limpiar Pantalla
				Escribir "--- DISTRIBUIR FONDOS A MISIONES ---"
				Si acumuladoDonaciones <= 0 Entonces
					Escribir "No hay fondos disponibles para distribuir."
				SiNo
					Si cantidadMisiones = 0 Entonces
						Escribir "No hay misiones registradas."
					SiNo
						Escribir "Fondos disponibles: ", acumuladoDonaciones
						Escribir ""
						Escribir "MISIONES ACTIVAS:"
						Escribir "-----------------------------------------------------"
						Para i <- 1 Hasta cantidadMisiones Con Paso 1 Hacer
							Si misiones[i,6] <> "Controlada" Entonces
								Escribir misiones[i,0], " | ", misiones[i,1], " | ", misiones[i,2], " | Recibido: ", donacionesPorMision[i]
							FinSi
						FinPara
						Escribir "-----------------------------------------------------"
						Escribir "Ingrese el ID de la mision destino (ej: M01): "
						Leer idMisionDestino
						idMisionDestino <- Mayusculas(idMisionDestino)
						
						// busca la mision -> (solo las activas)
						posMision <- -1
						Para i <- 1 Hasta cantidadMisiones Con Paso 1 Hacer
							Si misiones[i,0] = idMisionDestino Y misiones[i,6] <> "Controlada" Entonces
								posMision <- i
							FinSi
						FinPara
						
						Si posMision = -1 Entonces
							Escribir "[ERROR!] La mision no existe o ya esta controlada."
						SiNo
							Escribir "Cantidad a enviar a ", idMisionDestino, " (maximo ", acumuladoDonaciones, "): "
							Leer cantDistribuir
							
							Si cantDistribuir > 0 Y cantDistribuir <= acumuladoDonaciones Entonces
								Repetir
									Escribir "Confirmar envio de ", cantDistribuir, " a ", idMisionDestino, "? (S/N): "
									Leer confirmacion
									confirmacion <- Mayusculas(confirmacion)
									Si confirmacion <> "S" Y confirmacion <> "N" Entonces
										Escribir "[ERROR!] Opcion invalida. Debe ingresar S o N."
									FinSi
								Hasta Que confirmacion = "S" O confirmacion = "N"
								
								Si confirmacion = "S" Entonces
									acumuladoDonaciones <- acumuladoDonaciones - cantDistribuir
									donacionesPorMision[posMision] <- donacionesPorMision[posMision] + cantDistribuir
									Escribir ""
									Escribir "[OK] Se enviaron ", cantDistribuir, " a la mision ", idMisionDestino
									Escribir "La mision ya acumula: ", donacionesPorMision[posMision]
									Escribir "Fondos restantes en Finanzas: ", acumuladoDonaciones
								SiNo
									Escribir "[X] Distribucion cancelada."
								FinSi
							SiNo
								Escribir "[ERROR!] Cantidad invalida o supera los fondos disponibles."
							FinSi
						FinSi
					FinSi
				FinSi
				Escribir ""
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			4:
				Limpiar Pantalla
				Escribir "Sesion cerrada correctamente."
				Esperar 1 Segundos
				
			De Otro Modo:
				Escribir "Opcion invalida."
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
		FinSegun
	Hasta Que opFinanzas = 4
FinSubProceso

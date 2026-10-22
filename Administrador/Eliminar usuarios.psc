Algoritmo quitartrabajadores
	Definir cantidadMisiones, cantidadTrabajadores, cantidadTrabajadoresPorMision Como Entero
	Definir maximoMisiones, maximoTrabajadores, maximoTrabajadoresPorMision, maximoAdministradores, maximoUsuarios Como Entero
	Definir misiones, trabajadores, trabajadoresPorMision, administradores, usuarios Como Caracter
	Definir cantidadDatosMision, cantidadDatosTrabajador, cantidadDatosAdministrador, cantidadDatosUsuarios, cantidadUsuarios, filaUsuario Como Entero
	Definir num, totalStock Como Entero
	Definir stock Como Cadena
	Definir cantUsuarios, merengue Como Entero
	Definir verif, asegurar, nombyap, tipotrab Como Caracter
	Definir i, pos, j Como Entero
	Definir numeroNuevoTrabajador Como Entero
	Definir temp Como Caracter
	Definir acumuladoDonaciones Como Entero
	Definir pepito Como Logico
	pepito <- Falso
	numeroNuevoTrabajador <- 0
	cantidadMisiones <- 0
	cantidadTrabajadores <- 0
	cantidadUsuarios <- 0
	cantUsuarios <- 0
	maximoMisiones <- 20
	maximoUsuarios <- 40
	maximoTrabajadores <- 40
	maximoAdministradores <- 20
	maximoTrabajadoresPorMision <- 5
	cantidadDatosMision <- 7
	cantidadDatosTrabajador <- 3
	cantidadDatosAdministrador <- 5
	cantidadDatosUsuarios <- 3
	totalStock <- 0
	acumuladoDonaciones <- 0
	
	Dimension misiones[maximoMisiones, cantidadDatosMision]
	Dimension trabajadores[maximoTrabajadores, cantidadDatosTrabajador]
	Dimension administradores[maximoAdministradores, cantidadDatosAdministrador]
	Dimension usuarios[maximoUsuarios, cantidadDatosUsuarios]
	Dimension trabajadoresPorMision[maximoMisiones, maximoTrabajadoresPorMision]
	Dimension cantidadTrabajadoresPorMision[maximoMisiones]
	Dimension stock[10, 7]
	Dimensionar merengue(3,40)
	
	// N°1
	usuarios[0,0] <- "T01"
	usuarios[0,1] <- "N1colas"
	usuarios[0,2] <- "Pepito_"
	cantUsuarios <- cantUsuarios+1
	
	// N°2
	usuarios[1,0] <- "A01"
	usuarios[1,1] <- "PolloAlvarez"
	usuarios[1,2] <- "galletita123"
	cantUsuarios <- cantUsuarios+1
	
	// N°3
	usuarios[2,0] <- "A02"
	usuarios[2,1] <- "Jupiter123"
	usuarios[2,2] <- "planetatierra!"
	cantUsuarios <- cantUsuarios+1
			Escribir "Ingrese el ID de la persona que desea despedir"
			Leer tipotrab
			tipotrab <- Mayusculas(tipotrab)
			Repetir
				Para i<-0 Hasta 2 Con Paso 1 Hacer
					si(tipotrab=usuarios(i,0)) entonces
 						Para j<-0 Hasta cantidadDatosUsuarios-1 Con Paso 1 Hacer
							usuarios(i,j)<-""
							cantUsuarios<-cantUsuarios-1
						FinPara
						pepito<-Verdadero
					FinSi
				FinPara
				si pepito=Falso Entonces
					Escribir "no se encontro el usuario en cuestion"
					pepito<- Verdadero
				FinSi
			Hasta Que pepito=Verdadero
	Escribir ""
	Escribir "========== USUARIOS CARGADOS =========="
	
	Para i <- 0 Hasta 2 Hacer
		Para j <- 0 Hasta 2 Hacer
			Escribir Sin Saltar usuarios[i,j], " "
		FinPara
		Escribir ""
	FinPara
FinAlgoritmo

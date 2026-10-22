
Algoritmo sin_titulo
	Definir cantidadMisiones, cantidadTrabajadores, cantidadTrabajadoresPorMision Como Entero
	Definir maximoMisiones, maximoTrabajadores, maximoTrabajadoresPorMision, maximoAdministradores, maximoUsuarios Como Entero
	Definir misiones, trabajadores, trabajadoresPorMision, administradores, usuarios Como Caracter
	Definir cantidadDatosMision, cantidadDatosTrabajador, cantidadDatosAdministrador, cantidadDatosUsuarios, cantidadUsuarios, filaUsuario Como Entero
	Definir num, totalStock Como Entero
	Definir stock, pepito Como Cadena
	Definir cantUsuarios, merengue Como Entero
	Definir verif, asegurar, nombyap, tipotrab Como Caracter
	Definir i, pos, j Como Entero
	Definir numeroNuevoTrabajador Como Entero
	Definir temp Como Caracter
	Definir acumuladoDonaciones Como Entero
	
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
	
	Repetir
		Escribir "pepito es grande?"
		Leer pepito
		
		Si pepito <> "4" Entonces
			Escribir "Ingrese que tipo de trabajador quiere agregar: T(trabajador), A(administrador) y C(Contribuidor)"
			Leer tipotrab
			tipotrab <- Mayusculas(tipotrab)
			
			Mientras tipotrab <> "T" Y tipotrab <> "A" Y tipotrab <> "C" Hacer
				Escribir "Ingreso mal el tipo de trabajador"
				Leer tipotrab
				tipotrab <- Mayusculas(tipotrab)
			FinMientras
			
			Si cantUsuarios < maximoUsuarios Entonces
				
				Segun tipotrab Hacer
					"T":
						merengue(1,0) <- 0
						Para i <- 0 Hasta cantUsuarios-1 Hacer
							Si Subcadena(usuarios(i,0),1,1) = "T" Entonces
								merengue(1,0) <- merengue(1,0)+1
							FinSi
						FinPara
						
						merengue(1,0) <- merengue(1,0)+1
						
						Si merengue(1,0) <= 9 Entonces
							usuarios[cantUsuarios,0] <- "T0"+ConvertirATexto(merengue(1,0))
						SiNo
							usuarios[cantUsuarios,0] <- "T"+ConvertirATexto(merengue(1,0))
						FinSi
						
					"C":
						merengue(2,0) <- 0
						Para i <- 0 Hasta cantUsuarios-1 Hacer
							Si Subcadena(usuarios(i,0),1,1) = "C" Entonces
								merengue(2,0) <- merengue(2,0)+1
							FinSi
						FinPara
						
						merengue(2,0) <- merengue(2,0)+1
						
						Si merengue(2,0) <= 9 Entonces
							usuarios[cantUsuarios,0] <- "C0"+ConvertirATexto(merengue(2,0))
						SiNo
							usuarios[cantUsuarios,0] <- "C"+ConvertirATexto(merengue(2,0))
						FinSi
						
					"A":
						merengue(3,0) <- 0
						Para i <- 0 Hasta cantUsuarios-1 Hacer
							Si Subcadena(usuarios(i,0),1,1) = "A" Entonces
								merengue(3,0) <- merengue(3,0)+1
							FinSi
						FinPara
						
						merengue(3,0) <- merengue(3,0)+1
						
						Si merengue(3,0) <= 9 Entonces
							usuarios[cantUsuarios,0] <- "A0"+ConvertirATexto(merengue(3,0))
						SiNo
							usuarios[cantUsuarios,0] <- "A"+ConvertirATexto(merengue(3,0))
						FinSi
				FinSegun
				
				Escribir "Ingrese el nombre del usuario"
				Leer usuarios[cantUsuarios,1]
				
				Escribir "Ahora ingrese su contraseña"
				Leer usuarios[cantUsuarios,2]
				
				cantUsuarios <- cantUsuarios+1
				
			SiNo
				Escribir "No hay espacio para mas usuarios"
			FinSi
		FinSi
		
	Hasta Que pepito = "4"
	
	Escribir ""
	Escribir "========== USUARIOS CARGADOS =========="
	
	Para i <- 0 Hasta cantUsuarios-1 Hacer
		Para j <- 0 Hasta cantidadDatosUsuarios-1 Hacer
			Escribir Sin Saltar usuarios[i,j], " "
		FinPara
		Escribir ""
	FinPara
FinAlgoritmo

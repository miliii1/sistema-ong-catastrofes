Algoritmo ProgramaUnificado
	// ==========================================================
	// 			DEFINICION E INICIALIZACION DE VARIABLES   
	// ==========================================================
	Definir cantidadMisiones, cantidadTrabajadores Como Entero
	Definir cantidadUsuarios, cantidadAdministradores Como Entero
	Definir cantidadAsignaciones Como Entero
	Definir cantidadTrabajadoresPorMision Como Entero
	
	Definir maximoMisiones, maximoTrabajadores Como Entero
	Definir maximoAdministradores, maximoUsuarios Como Entero
	Definir maximoTrabajadoresPorMision, maximoAsignaciones Como Entero
	
	Definir num, totalStock, filaUsuario Como Entero
	Definir acumuladoDonaciones, k Como Entero
	
	maximoMisiones <- 20
	maximoTrabajadores <- 40
	maximoAdministradores <- 20
	maximoUsuarios <- 10
	maximoTrabajadoresPorMision <- 5
	
	maximoAsignaciones <- maximoMisiones * maximoTrabajadoresPorMision
	
	cantidadMisiones <- 0
	cantidadTrabajadores <- 0
	cantidadUsuarios <- 0
	cantidadAdministradores <- 0
	cantidadAsignaciones <- 0
	acumuladoDonaciones <- 0
	totalStock <- 0
	
	// ==========================================================
	// 					 VECTORES USUARIOS
	// ==========================================================
	Definir idUsuario, nombreUsuario Como Caracter
	Definir contraseñaUsuario, rolUsuario Como Caracter
	
	Dimension idUsuario[maximoUsuarios]
	Dimension nombreUsuario[maximoUsuarios]
	Dimension contraseñaUsuario[maximoUsuarios]
	Dimension rolUsuario[maximoUsuarios]
	
	// ==========================================================
	// 			      VECTORES ADMINISTRADORES
	// ==========================================================
	Definir idAdministrador, nombreAdministrador Como Caracter
	Definir apellidoAdministrador Como Caracter
	
	Dimension idAdministrador[maximoAdministradores]
	Dimension nombreAdministrador[maximoAdministradores]
	Dimension apellidoAdministrador[maximoAdministradores]
	
	// ==========================================================
	//                VECTORES TRABAJADORES
	// ==========================================================
	Definir idTrabajador, nombreTrabajador Como Caracter
	Definir apellidoTrabajador Como Caracter
	
	Dimension idTrabajador[maximoTrabajadores]
	Dimension nombreTrabajador[maximoTrabajadores]
	Dimension apellidoTrabajador[maximoTrabajadores]
	
	// ==========================================================
	//                 VECTORES MISIONES
	// ==========================================================
	Definir idMision, tipoMision Como Caracter
	Definir provinciaMision, localidadMision Como Caracter
	Definir descripcionMision, prioridadMision Como Caracter
	Definir estadoMision Como Caracter
	
	Dimension idMision[maximoMisiones]
	Dimension tipoMision[maximoMisiones]
	Dimension provinciaMision[maximoMisiones]
	Dimension localidadMision[maximoMisiones]
	Dimension descripcionMision[maximoMisiones]
	Dimension prioridadMision[maximoMisiones]
	Dimension estadoMision[maximoMisiones]
	
	Definir misionAsignada, trabajadorAsignado Como Caracter
	
	Dimension misionAsignada[maximoAsignaciones]
	Dimension trabajadorAsignado[maximoAsignaciones]
	Dimension cantidadTrabajadoresPorMision[maximoMisiones]
	
	// ==========================================================
	// 					VECTORES DE STOCK
	// ==========================================================
	Definir stockId, stockNombre, stockCategoria Como Caracter
	Definir stockUnidad, stockEstado Como Caracter
	Definir stockCantidad, donacionesPorMision Como Entero
	
	Dimension stockId[11]
	Dimension stockNombre[11]
	Dimension stockCategoria[11]
	Dimension stockCantidad[11]
	Dimension stockUnidad[11]
	Dimension stockEstado[11]
	
	Dimension donacionesPorMision[maximoMisiones + 1]
	
	Para k <- 0 Hasta maximoMisiones Hacer
		donacionesPorMision[k] <- 0
	FinPara
	
	//=============================================
	// 			CARGAR BASE DE DATOS
	//=============================================
	cargarBaseDatos(idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, cantidadUsuarios, idAdministrador, nombreAdministrador, apellidoAdministrador, cantidadAdministradores, idTrabajador, nombreTrabajador, apellidoTrabajador, cantidadTrabajadores, idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantidadMisiones, misionAsignada, trabajadorAsignado, cantidadTrabajadoresPorMision, cantidadAsignaciones, stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock)
	
	
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
				filaUsuario <- iniciarSesion(idUsuario, nombreUsuario, contraseñaUsuario, maximoUsuarios, cantidadUsuarios)
				si filaUsuario <> -1 Entonces
					elegirPerfilUsuario(filaUsuario, idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, cantidadUsuarios, maximoUsuarios, cantidadAdministradores, idAdministrador, maximoAdministradores, nombreAdministrador, apellidoAdministrador, idTrabajador, nombreTrabajador, apellidoTrabajador, cantidadTrabajadores, maximoTrabajadores, cantidadMisiones, cantidadTrabajadoresPorMision, misionAsignada, idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, trabajadorAsignado, cantidadAsignaciones, stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock, acumuladoDonaciones, donacionesPorMision, maximoMisiones, maximoTrabajadoresPorMision, maximoAsignaciones)
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
//                  BASE DE DATOS FALSA
// ==========================================================

SubProceso cargarBaseDatos(idUsuario, nombreUsuario, contrasenaUsuario, rolUsuario, cantidadUsuarios Por Referencia, idAdministrador , nombreAdministrador, apellidoAdministrador, cantidadAdministradores Por Referencia, idTrabajador, nombreTrabajador, apellidoTrabajador, cantidadTrabajadores Por Referencia, idMision Por Referencia, tipoMision Por Referencia, provinciaMision Por Referencia, localidadMision Por Referencia, descripcionMision, prioridadMision, estadoMision, cantidadMisiones Por Referencia, misionAsignada, trabajadorAsignado, cantidadTrabajadoresPorMision Por Referencia, cantidadAsignaciones Por Referencia, stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock Por Referencia)
	
	cargarStock(stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock)
	
    // ==========================================
    // USUARIOS
    // ==========================================
	
    // Administrador
    idUsuario[0] <- "A01"
    nombreUsuario[0] <- "N1colas"
    contrasenaUsuario[0] <- "Pepito_"
    rolUsuario[0] <- "ADMINISTRADOR"
	
    // Trabajador
    idUsuario[1] <- "T03"
    nombreUsuario[1] <- "zNiko"
    contrasenaUsuario[1] <- "123"
    rolUsuario[1] <- "TRABAJADOR"
	
    // Coordinador
    idUsuario[2] <- "C01"
    nombreUsuario[2] <- "CoordAnakin"
    contrasenaUsuario[2] <- "anakin2026"
    rolUsuario[2] <- "COORDINADOR"
	
	// Finanzas
	idUsuario[3] <- "F01"
    nombreUsuario[3] <- "FinanAna"
    contrasenaUsuario[3] <- "ana2026"
    rolUsuario[3] <- "FINANZAS"
	
	
    cantidadUsuarios <- 4
	
    // ==========================================
    // PERFIL DEL ADMINISTRADOR
    // ==========================================
	
    idAdministrador[0] <- "A01"
    nombreAdministrador[0] <- "Nicolas Gaby"
    apellidoAdministrador[0] <- "Arumax"
	
    cantidadAdministradores <- 1
	
    // ==========================================
    // PERFILES DE TRABAJADORES
    // ==========================================
	
    idTrabajador[0] <- "T01"
    nombreTrabajador[0] <- "Matias"
    apellidoTrabajador[0] <- "Perez"
	
    idTrabajador[1] <- "T02"
    nombreTrabajador[1] <- "Juan"
    apellidoTrabajador[1] <- "Lopez"
	
    idTrabajador[2] <- "T03"
    nombreTrabajador[2] <- "Nicolas"
    apellidoTrabajador[2] <- "Gutierrez"
	
    cantidadTrabajadores <- 3
	
    // ==========================================
    // MISION 1
    // ==========================================
	
    idMision[0] <- "M01"
    tipoMision[0] <- "Inundacion"
    provinciaMision[0] <- "Buenos Aires"
    localidadMision[0] <- "La Matanza"
    descripcionMision[0] <- "Asistencia a familias afectadas"
    prioridadMision[0] <- "ALTA"
    estadoMision[0] <- "En curso"
	
    // ==========================================
    // MISION 2
    // ==========================================
	
    idMision[1] <- "M02"
    tipoMision[1] <- "Incendio"
    provinciaMision[1] <- "Cordoba"
    localidadMision[1] <- "Villa Carlos Paz"
    descripcionMision[1] <- "Evacuacion y entrega de suministros"
    prioridadMision[1] <- "MEDIA"
    estadoMision[1] <- "En camino"
	
    // ==========================================
    // MISION 3
    // ==========================================
	
    idMision[2] <- "M03"
    tipoMision[2] <- "Terremoto"
    provinciaMision[2] <- "Mendoza"
    localidadMision[2] <- "Godoy Cruz"
    descripcionMision[2] <- "Entrega de kits medicos"
    prioridadMision[2] <- "BAJA"
    estadoMision[2] <- "En curso"
	
    cantidadMisiones <- 3
	
    // ==========================================
    // ASIGNACIONES DE TRABAJADORES
    // ==========================================
	
    // T02 -> M01
    misionAsignada[0] <- "M01"
    trabajadorAsignado[0] <- "T02"
	
    // T01 -> M02
    misionAsignada[1] <- "M02"
    trabajadorAsignado[1] <- "T01"
	
    cantidadTrabajadoresPorMision[0] <- 1
    cantidadTrabajadoresPorMision[1] <- 1
	cantidadTrabajadoresPorMision[2] <- 0
	
    cantidadAsignaciones <- 2
	
FinSubProceso

SubProceso cargarStock(stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock Por Referencia)
	totalStock <- 5
	
	stockId[1] <- "S01"
	stockNombre[1] <- "Agua Mineral (Pack)"
	stockCategoria[1] <- "Hidratacion"
	stockCantidad[1] <- 120
	stockUnidad[1] <- "lts"
	stockEstado[1] <- "Optimo"
	
	stockId[2] <- "S02"
	stockNombre[2] <- "Alimentos No Perecederos"
	stockCategoria[2] <- "Alimentacion"
	stockCantidad[2] <- 45
	stockUnidad[2] <- "kg"
	stockEstado[2] <- "Bajo"
	
	stockId[3] <- "S03"
	stockNombre[3] <- "Kits Primeros Auxilios"
	stockCategoria[3] <- "Medicamentos"
	stockCantidad[3] <- 12
	stockUnidad[3] <- "uds"
	stockEstado[3] <- "Critico"
	
	stockId[4] <- "S04"
	stockNombre[4] <- "Cascos y Arneses"
	stockCategoria[4] <- "Rescate"
	stockCantidad[4] <- 30
	stockUnidad[4] <- "uds"
	stockEstado[4] <- "Optimo"
	
	stockId[5] <- "S05"
	stockNombre[5] <- "Radios VHF Portatiles"
	stockCategoria[5] <- "Comunicacion"
	stockCantidad[5] <- 8
	stockUnidad[5] <- "uds"
	stockEstado[5] <- "Bajo"
FinSubProceso

// ==========================================================
//                         USUARIOS
// ==========================================================

Funcion posUsuario <- iniciarSesion(idUsuario, nombreUsuario, contraseñaUsuario, maxUsuarios, cantUsuarios)
	
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
		posUsuario <- buscarUsuario(nombreIngresado, nombreUsuario, cantUsuarios)
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
				Si	validarContraseña(posUsuario, contraseñaIngresada, contraseñaUsuario) Entonces
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
		Escribir "Bienvenido [",idUsuario[posUsuario], "] ", nombreUsuario[posUsuario]
	SiNo
		Escribir ""
		Escribir "[ERROR] Demasiados intentos fallidos. Vuelve a intentarlo."
		Esperar 2 Segundos
		posUsuario <- -1
	FinSi
	
FinFuncion

Funcion fila <- buscarUsuario (nombreBuscado, nombreUsuarios, cantUsuarios)
	Definir i como entero
	Definir fila Como entero
	i <- 0
	fila <- -1 
	
	Mientras i < cantUsuarios Y fila = -1 Hacer
		Si	nombreUsuarios[i] = nombreBuscado Entonces
			fila <- i
		SiNo
			i <- i + 1 
		FinSi
	FinMientras
FinFuncion

Funcion esCorrecto <- validarContraseña(posUsuario, contraseña, contraseñaUsuario)
	Definir i Como Entero
	Definir esCorrecto Como Logico
	
	esCorrecto <- Falso
	
	Si	contraseñaUsuario[posUsuario] = contraseña Entonces
		esCorrecto <- Verdadero
	FinSi
FinFuncion

SubProceso elegirPerfilUsuario (filaUsuario, idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, cantidadUsuario Por Referencia, maximoUsuarios, cantidadAdministradores Por Referencia, maxAdministradores, idAdministrador, nombreAdministrador, apellidoAdministrador, idTrabajador, nombreTrabajador, apellidoTrabajador, cantTrabajadores por Referencia, maxTrabajadores, cantidadMisiones, cantTrabajadoresPorMision, misionAsignada, idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, trabajadorAsignado, cantidadAsignaciones Por Referencia, stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock Por Referencia, acumuladoDonaciones Por Referencia, donacionesPorMision, maximoMisiones, maximoTrabajadoresPorMision, maximoAsignaciones)
	
    // Ejecutar el módulo según el rol
    Segun rolUsuario[filaUsuario] Hacer
        "ADMINISTRADOR":
            administrador(filaUsuario, idUsuario[filaUsuario], idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, cantidadUsuario, maximoUsuarios, cantidadAdministradores, idAdministrador, maxAdministradores, nombreAdministrador, apellidoAdministrador, idTrabajador, nombreTrabajador, apellidoTrabajador, cantTrabajadores, maxTrabajadores)
        "TRABAJADOR":
            trabajador(idUsuario[filaUsuario], idTrabajador, nombreTrabajador, apellidoTrabajador, idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantidadMisiones, cantTrabajadoresPorMision, misionAsignada, trabajadorAsignado, cantTrabajadores, cantidadAsignaciones)
		"COORDINADOR":
            coordinador(idUsuario[filaUsuario], idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantidadMisiones, idTrabajador, nombreTrabajador, apellidoTrabajador, cantTrabajadores, misionAsignada, trabajadorAsignado, cantidadAsignaciones, cantTrabajadoresPorMision, maximoMisiones, maximoTrabajadoresPorMision, maximoAsignaciones, stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock, acumuladoDonaciones)
        "COLABORADOR":
            //colaborador(idUsuario, misiones, cantidadMisiones)
        "FINANZAS":
            finanzas(idUsuario[filaUsuario], acumuladoDonaciones, idMision, tipoMision, provinciaMision, estadoMision, cantidadMisiones, donacionesPorMision)
        De Otro Modo:
            Escribir "[ERROR] El ID no tiene un rol reconocido."
            Esperar Tecla
    FinSegun
FinSubProceso

// ==========================================================
//                        TRABAJADOR
// ==========================================================
SubProceso trabajador (trabajadorBuscado, idTrabajador, nombreTrabajador, apellidoTrabajador, idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantMisiones, cantTrabajadoresPorMision, misionAsignada, trabajadorAsignado, cantTrabajadores, cantAsignaciones)
	
	Definir i, j, posTrabajadorAsignado, posMisionAsignada Como Entero
	Definir valido Como Logico
	
	//==========================================================
	//          INGRESO Y SELECCION DEL TRABAJADOR
	//==========================================================
	Limpiar Pantalla
	Si cantTrabajadores <> 0 Entonces
		// Busca la misión asignada al trabajador seleccionado
		posMisionAsignada <- buscarMisionTrabajador(trabajadorBuscado, idTrabajador, cantAsignaciones, cantMisiones, trabajadorAsignado, misionAsignada, idMision, cantTrabajadores, posTrabajadorAsignado)
		// Inicia el panel correspondiente al trabajador
		menuTrabajador(idMision, posMisionAsignada, idTrabajador, posTrabajadorAsignado, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, nombreTrabajador, apellidoTrabajador, cantMisiones)
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
FinSubProceso 

Funcion indiceMisionAsignada <- buscarMisionTrabajador(trabajadorBuscado, idTrabajador, cantAsignaciones, cantidadMisiones, trabajadorAsignado, misionAsignada, idMision, cantTrabajadores, posTrabajadorAsignado Por Referencia)
	Definir i, j, indiceMisionAsignada Como Entero
	Definir misionBuscada Como Caracter
	i <- 0
	j <- 0
	indiceMisionAsignada <- -1
	posTrabajadorAsignado <- -1
	
	// Buscar una asignacion del trabajador
	Mientras i < cantAsignaciones Y indiceMisionAsignada = -1 Hacer
		Si trabajadorAsignado[i] = trabajadorBuscado Entonces
			// Obtener la misión asociada a esa asignación.
			misionBuscada <- misionAsignada[i]
			// Buscar el ID de la misión en el vector de misiones.
			j <- 0
			Escribir "Trabajador buscado: ", trabajadorBuscado
			Escribir "Asignaciones registradas: ", cantAsignaciones
			Escribir "Trabajador en indice ", i, ": ", trabajadorAsignado[i]
			Esperar Tecla
			Mientras j < cantidadMisiones Y indiceMisionAsignada = -1 Hacer
				Si idMision[j] = misionBuscada Entonces
					indiceMisionAsignada <- j
				SiNo
					j <- j + 1
				FinSi
			FinMientras
		FinSi
		i <- i + 1
	FinMientras
	i <- 0
	Mientras i < cantTrabajadores Y posTrabajadorAsignado = -1 Hacer
		Si idTrabajador[i] = trabajadorBuscado Entonces
			posTrabajadorAsignado <- i
		SiNo
			i <- i + 1
		FinSi
	FinMientras
FinFuncion

SubProceso menuTrabajador(idMision, posMisionAsig, idTrabajador, posTrabajadorAsig, tipoMision, provMision, localidadMision, descripMision, prioriMision, estadoMision, nomTrabajador, apeTrabajador, cantMisiones)
	Definir opc Como Entero
	Limpiar Pantalla
	Repetir
		Escribir ""
		Escribir "=========================================================="
		Escribir "                 MENU DEL TRABAJADOR"
		Escribir "=========================================================="
		Escribir "ID: ", idTrabajador[posTrabajadorAsig]
		Escribir "Bienvenido ", nomTrabajador[posTrabajadorAsig], " ", apeTrabajador[posTrabajadorAsig]
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
				verMision(idMision, posMisionAsig, tipoMision, provMision, localidadMision, descripMision, prioriMision, estadoMision, cantMisiones)
			2:
				verEstado(idMision, posMisionAsig, estadoMision, cantMisiones)
			3:
				cambiarEstado(idMision, posMisionAsig, estadoMision, cantMisiones)
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

SubProceso verMision(idMision, posMisionAsig, tipoMision, provMision, localidadMision, descripMision, prioriMision, estadoMision, cantMisiones)
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    MISION ASIGNADA                       |"
	Escribir "+----------------------------------------------------------+"
	
	Si posMisionAsig >= 0 Y posMisionAsig < cantMisiones Entonces
		Escribir "| ID Mision    : ", idMision[posMisionAsig]
		Escribir "| Tipo         : ", tipoMision[posMisionAsig]
		Escribir "| Provincia    : ", provMision[posMisionAsig]
		Escribir "| Localidad    : ", localidadMision[posMisionAsig]
		Escribir "| Descripcion  : ", descripMision[posMisionAsig]
		Escribir "| Nivel        : ", prioriMision[posMisionAsig]
		Escribir "+----------------------------------------------------------+"
	SiNo
		Escribir "[ERROR] Este trabajador no tiene ninguna mision asignada."
	FinSi
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

SubProceso verEstado(idMision, posMisionAsig, estadoMision, cantMisiones)
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    ESTADO DE MISION                      |"
	Escribir "+----------------------------------------------------------+"
	
	Si posMisionAsig >= 0 Y posMisionAsig < cantMisiones Entonces
		Escribir "| Mision: ", idMision[posMisionAsig]
		Escribir "| Estado actual: ", estadoMision[posMisionAsig]
		Escribir "+----------------------------------------------------------+"
	SiNo
		Escribir "Este trabajador no tiene ninguna mision asignada."
	FinSi
	Escribir ""
	Escribir "Presione Enter para continuar..."
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

SubProceso cambiarEstado(idMision, posMisionAsig, estadoMision, cantMisiones)
	
	Definir opcionEstado Como Entero
	
	Limpiar Pantalla
	Escribir ""
	Escribir "+----------------------------------------------------------+"
	Escribir "|                    CAMBIAR ESTADO                        |"
	Escribir "+----------------------------------------------------------+"
	
	Si posMisionAsig >= 0 Y posMisionAsig < cantMisiones Entonces
		Escribir "| Mision: ", idMision[posMisionAsig]
		Escribir "| Estado actual: ", estadoMision[posMisionAsig]
		Escribir ""
		Si estadoMision[posMisionAsig] = "Controlada" Entonces
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
					Si estadoMision[posMisionAsig] = "En camino" Entonces
						Escribir "La mision ya se encuentra en camino."
					SiNo
						Si estadoMision[posMisionAsig] = "En curso" O estadoMision[posMisionAsig] = "Controlada" Entonces
							Escribir "No se puede volver al estado En camino."
						FinSi
					FinSi
				2:
					Si estadoMision[posMisionAsig] = "En camino" Entonces
						estadoMision[posMisionAsig] <- "En curso"
						Escribir "Se cambio el estado correctamente a En curso"
					SiNo
						Si estadoMision[posMisionAsig] = "En curso" Entonces
							Escribir "La mision ya se encuentra En curso."
						SiNo
							Escribir "No se puede pasar una mision Controlada a En curso."
						FinSi
					FinSi
				3:
					Si estadoMision[posMisionAsig] = "En curso" Entonces
						estadoMision[posMisionAsig] <- "Controlada"
						Escribir "Se cambio el estado correctamente a Controlada"
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
		Escribir "[ERROR] Este trabajador no tiene ninguna mision asignada."
	FinSi
	Escribir ""
	Escribir "Precione cualquier tecla para continuar"
	Esperar Tecla
	Limpiar Pantalla
FinSubProceso

// ==========================================================
//                        ADMINISTRADOR
// ==========================================================

SubProceso administrador(posUsuario, idRolUsuario, idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, cantUsuarios Por Referencia, maxUsuarios, cantidadAdministradores Por Referencia, maxAdministradores, idAdministrador, nombreAdministrador, apellidoAdministrador, idTrabajador, nombreTrabajador, apellidoTrabajador, cantTrabajador Por Referencia, maxTrabajadores)
	
	Definir opcion Como Entero
	Definir id, asegurar Como Logico
	
	Repetir
		//FALTA - Buscar el ID del administrador y la posicion del vector (Muestra el nombre y apellido pero en la posicion del usuario, no del administrador)
		Limpiar Pantalla
		Escribir cantidadAdministradores
		Escribir "======================================"
		Escribir "          ADMINISTRADORES"
		Escribir "======================================"
		Escribir "Bienvenido: ", nombreAdministrador[posUsuario], " ", apellidoAdministrador[posUsuario]
		Escribir "1. Agregar usuario"
		Escribir "2. Quitar trabajador"
		Escribir "3. Quitar mision"
		Escribir "5. Salir"
		Escribir "======================================"
		Escribir "Ingrese una opcion: "
		Leer opcion
		
		Segun opcion Hacer
			
			1:
				AgregarUsuario(idRolUsuario, idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, idAdministrador, nombreAdministrador, apellidoAdministrador, cantidadAdministradores, maxAdministradores, cantUsuarios, maxUsuarios, idTrabajador, nombreTrabajador, apellidoTrabajador, cantTrabajador, maxTrabajadores)
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
FinSubProceso

SubProceso AgregarUsuario(idRolUsuario, idUsuario, nombreUsuario, contraseñaUsuario, rolUsuario, idAdministrador, nombreAdministrador, apellidoAdministrador, cantidadAdministradores Por Referencia, maxAdministradores, cantUsuarios Por Referencia, maxUsuarios, idTrabajador, nombreTrabajador, apellidoTrabajador, cantTrabajador, maxTrabajador)
	Definir rol,nombyap, contra Como Caracter
	definir i,pos,j  Como Entero
	Definir numeroNuevoTrabajador Como Entero
	
	numeroNuevoTrabajador <- 0
	
	Escribir "+----------------------------------------------------------+"
	Escribir "|                        USUARIOS                          |"
	Escribir "+----------------------------------------------------------+"
	Escribir ""
	Repetir
		Escribir "Ingrese el rol del usuario que quiere agregar: T(trabajador), A(administrador) y C(Contribuidor)"
		leer rol
		rol <- Mayusculas(rol)
		Mientras rol <> "T" y rol <> "A" y rol <> "C" y rol <> "S" Hacer
			Escribir "[ERROR] Ingreso mal el rol del usuario"
			Escribir "Presione cualquier tecla para continuar"
			Esperar Tecla 
		FinMientras
		
		Si cantUsuarios < maxUsuarios Entonces //continuar
			
			//FALTA - Agregar los roles que faltan
			Segun rol Hacer
				"T":
					Escribir cantUsuarios
					Escribir cantTrabajador
					Esperar Tecla
					
					Limpiar Pantalla
					
					Si cantTrabajador < maxTrabajador Entonces
						idTrabajador[cantTrabajador] <- "T0" + ConvertirATexto(cantTrabajador)
						
						Escribir "Ingrese el nombre del Trabajador"
						Leer nombreTrabajador[cantTrabajador]
						Escribir "Ingrese el apellido del Trabajador"
						Leer apellidoTrabajador[cantTrabajador]
						
						idUsuario[cantUsuarios] <- "T0" + ConvertirATexto(cantTrabajador)
						Escribir "Ingrese el nombre del Usuario"
						Leer nombreUsuario[cantUsuarios]
						Escribir "Ingrese la contraseña del Usuario"
						Leer contraseñaUsuario[cantUsuarios]
						rolUsuario[cantUsuarios] <- "TRABAJADOR"
					FinSi
					cantTrabajador <- cantTrabajador + 1
					cantUsuarios <- cantUsuarios + 1
				"A":
					Limpiar Pantalla
					Si cantidadAdministradores < maxAdministradores Entonces
						
						idAdministrador[cantidadAdministradores] <- "A0" + ConvertirATexto(cantidadAdministradores)
						Escribir "Ingrese nombre del Administrador"
						Leer nombreAdministrador[cantidadAdministradores]
						Escribir "Ingrese apellido del Administrador"
						Leer apellidoAdministrador[cantidadAdministradores]
						idUsuario[cantUsuarios] <- "A0" + ConvertirATexto(cantidadAdministradores)
						Escribir "Ingrese el nuevo nombre de usuario: "
						Leer nombreUsuario[cantUsuarios]
						Escribir "Ingrese la contraseña: "
						Leer contraseñaUsuario[cantUsuarios]
						Escribir "Ingrese nuevamente la contraseña para confirmar: "
						Leer contra
						rolUsuario[cantUsuarios] <- "ADMINISTRADOR"
						Si contra <> contraseñaUsuario[cantUsuarios] Entonces
							Escribir "[ERROR] La contraseña ingresada no coincide"
						FinSi
					SiNo
						Escribir "No se puede agregar mas bro, nt"
					FinSi
					cantidadAdministradores <- cantidadAdministradores + 1
					cantUsuarios <- cantUsuarios + 1
			FinSegun
			Escribir nombreUsuario[1]
			Escribir cantUsuarios
			Esperar Tecla
		FinSi
	Hasta Que rol="S"
FinSubProceso

SubProceso EliminarTrabajadores(misiones, trabajadores, cantTrabajadoresAsignados, trabajadoresAsignados, cantMisiones Por Referencia, cantTrabajadores Por Referencia)
	//FALTA - Pasarlo a vectores (La logica esta bien, pero esta aplicado en matrices)
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

SubProceso coordinador (idCoordinador, idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantidadMisiones Por Referencia, idTrabajador, nombreTrabajador, apellidoTrabajador, cantidadTrabajadores, misionAsignada, trabajadorAsignado, cantidadAsignaciones Por Referencia, cantidadTrabajadoresPorMision, maximoMisiones, maximoTrabajadoresPorMision, maximoAsignaciones, stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock Por Referencia, acumuladoDonaciones Por Referencia)
	Definir opcion Como Entero
	
	Repetir
		Borrar Pantalla 
		Escribir " ================ PANEL DE COORDINADOR ================ "
		Escribir "ID: ", idCoordinador
		Escribir "Fondos disponibles: $", acumuladoDonaciones
		Escribir ""
		Escribir "[1] Crear mision"
		Escribir "[2] Misiones activas"
		Escribir "[3] Asignar trabajadores"
		Escribir "[4] Stock y compra de insumos"
		Escribir "[5] Cerrar sesion"
		Escribir "------------------------------------------------------"
		Escribir "Seleccione una opcion: "
		Leer opcion
		
		Segun opcion Hacer
			1:
				Borrar Pantalla
				crearMision(idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantidadMisiones, maximoMisiones, cantidadTrabajadoresPorMision)
			2:
				Borrar Pantalla
				mostrarMisionesActivas(idMision, tipoMision, provinciaMision, localidadMision, prioridadMision, estadoMision, cantidadMisiones)
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			3:
				Borrar Pantalla
				asignarTrabajadores(idMision, tipoMision, provinciaMision, prioridadMision, estadoMision, cantidadMisiones, idTrabajador, nombreTrabajador, apellidoTrabajador, cantidadTrabajadores, misionAsignada, trabajadorAsignado, cantidadAsignaciones, cantidadTrabajadoresPorMision, maximoTrabajadoresPorMision, maximoAsignaciones)
				Escribir ""
				Escribir "Presione una tecla para volver al menu..."
				Esperar Tecla
			4:
				gestionarStock(stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock, acumuladoDonaciones)
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
SubProceso crearMision(idMision, tipoMision, provinciaMision, localidadMision, descripcionMision, prioridadMision, estadoMision, cantidadMisiones Por Referencia, maximoMisiones, cantidadTrabajadoresPorMision)
	Definir confirmacion, urgencia Como Caracter
	Definir i Como Entero
	
	Si cantidadMisiones >= maximoMisiones Entonces
		Escribir "[ERROR] Se alcanzo el maximo de misiones permitidas."
	SiNo
		// Base 0: la nueva mision va en la posicion cantidadMisiones,
		// pero su numero visible es cantidadMisiones + 1 (ej: 3 misiones -> M04)
		i <- cantidadMisiones
		
		Si i + 1 < 10 Entonces
			idMision[i] <- "M0" + ConvertirATexto(i + 1)
		SiNo
			idMision[i] <- "M" + ConvertirATexto(i + 1)
		FinSi
		
		Escribir "--- CREAR NUEVA MISION ---"
		Escribir "ID asignado: ", idMision[i]
		Escribir "Tipo de emergencia: "
		Leer tipoMision[i]
		Escribir "Zona / Provincia: "
		Leer provinciaMision[i]
		Escribir "Localidad / Area: "
		Leer localidadMision[i]
		Escribir "Descripcion: "
		Leer descripcionMision[i]
		
		// Repite hasta que se elija una urgencia valida
		Repetir
			Escribir "Nivel de urgencia [1] BAJA   [2] MEDIA   [3] ALTA: "
			Leer urgencia
			Si urgencia = "1" Entonces
				prioridadMision[i] <- "BAJA"
			SiNo
				Si urgencia = "2" Entonces
					prioridadMision[i] <- "MEDIA"
				SiNo
					Si urgencia = "3" Entonces
						prioridadMision[i] <- "ALTA"
					SiNo
						Escribir "[ERROR] Opcion invalida. Elija 1, 2 o 3."
						urgencia <- ""
					FinSi
				FinSi
			FinSi
		Hasta Que urgencia <> ""
		
		estadoMision[i] <- "En camino"
		
		Escribir ""
		Escribir "+----------------------------------------------------------+"
		Escribir "|                 VISTA PREVIA DE LA MISION                |"
		Escribir "+----------------------------------------------------------+"
		Escribir "| Tipo      : ", tipoMision[i]
		Escribir "| Ubicacion : ", provinciaMision[i], " - ", localidadMision[i]
		Escribir "| Urgencia  : ", prioridadMision[i]
		Escribir "| Detalle   : ", descripcionMision[i]
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
			cantidadTrabajadoresPorMision[i] <- 0
			cantidadMisiones <- cantidadMisiones + 1
			Escribir "----------------------------------------------------------"
			Escribir "  [OK] MISION REGISTRADA CON ID: ", idMision[i]
			Escribir "----------------------------------------------------------"
		SiNo
			Escribir "----------------------------------------------------------"
			Escribir "  [X] MISION CANCELADA. Los datos no se guardaron."
			Escribir "----------------------------------------------------------"
			// (en el original usaba "pos", que no existe: se limpia la posicion i)
			idMision[i] <- ""
			tipoMision[i] <- ""
			provinciaMision[i] <- ""
			localidadMision[i] <- ""
			descripcionMision[i] <- ""
			prioridadMision[i] <- ""
			estadoMision[i] <- ""
		FinSi
	FinSi
	
	Escribir ""
	Escribir "Presione una tecla para continuar..."
	Esperar Tecla
FinSubProceso

// ======================================= Misiones activas
SubProceso mostrarMisionesActivas(idMision, tipoMision, provinciaMision, localidadMision, prioridadMision, estadoMision, cantidadMisiones)
	Definir j, activas Como Entero
	activas <- 0
	
	Escribir "--- MISIONES ACTIVAS ---"
	Escribir "----------------------------------------------------------"
	Para j <- 0 Hasta cantidadMisiones - 1 Con Paso 1 Hacer
		Si estadoMision[j] <> "Controlada" Entonces
			Escribir idMision[j], " | ", tipoMision[j], " | ", provinciaMision[j], " - ", localidadMision[j], " | Urgencia: ", prioridadMision[j], " | Estado: ", estadoMision[j]
			activas <- activas + 1
		FinSi
	FinPara
	
	Si activas = 0 Entonces
		Escribir "No hay misiones activas registradas."
	FinSi
	Escribir "----------------------------------------------------------"
FinSubProceso

// ======================================= Devuelve la mision de un trabajador ("" si esta libre)
Funcion misionActual <- misionDeTrabajador(trabajadorAsignado, misionAsignada, cantidadAsignaciones, idBuscado)
	Definir misionActual Como Caracter
	Definir i Como Entero
	misionActual <- ""
	Para i <- 0 Hasta cantidadAsignaciones - 1 Con Paso 1 Hacer
		Si trabajadorAsignado[i] = idBuscado Entonces
			misionActual <- misionAsignada[i]
		FinSi
	FinPara
FinFuncion

// ======================================= Asignar trabajadores
SubProceso asignarTrabajadores(idMision, tipoMision, provinciaMision, prioridadMision, estadoMision, cantidadMisiones, idTrabajador, nombreTrabajador, apellidoTrabajador, cantidadTrabajadores, misionAsignada, trabajadorAsignado, cantidadAsignaciones Por Referencia, cantidadTrabajadoresPorMision, maximoTrabajadoresPorMision, maximoAsignaciones)
	Definir confirmacion, idMisionBuscada, idTrabajadorBuscado, misionOcupada Como Caracter
	Definir i, j, posMision, posTrabajador, activas Como Entero
	
	Escribir "--- ASIGNAR TRABAJADORES ---"
	
	Si cantidadMisiones = 0 Entonces
		Escribir "No hay misiones registradas."
	SiNo
		Si cantidadTrabajadores = 0 Entonces
			Escribir "No hay trabajadores cargados."
		SiNo
			// ---- Listado de misiones (solo las no controladas) ----
			Escribir "MISIONES DISPONIBLES:"
			Escribir "----------------------------------------------------------"
			activas <- 0
			Para j <- 0 Hasta cantidadMisiones - 1 Con Paso 1 Hacer
				Si estadoMision[j] <> "Controlada" Entonces
					Escribir idMision[j], " | ", tipoMision[j], " | ", provinciaMision[j], " | Urgencia: ", prioridadMision[j], " | Trabajadores: ", cantidadTrabajadoresPorMision[j], "/", maximoTrabajadoresPorMision
					activas <- activas + 1
				FinSi
			FinPara
			Escribir "----------------------------------------------------------"
			
			Si activas = 0 Entonces
				Escribir "No hay misiones activas para asignar."
			SiNo
				// ---- Se elige la mision por ID (asi no hay confusion con los indices) ----
				posMision <- -1
				Repetir
					Escribir "Ingrese el ID de la mision (ej: M01) o 0 para cancelar: "
					Leer idMisionBuscada
					idMisionBuscada <- Mayusculas(idMisionBuscada)
					Si idMisionBuscada <> "0" Entonces
						Para i <- 0 Hasta cantidadMisiones - 1 Con Paso 1 Hacer
							Si idMision[i] = idMisionBuscada Y estadoMision[i] <> "Controlada" Entonces
								posMision <- i
							FinSi
						FinPara
						Si posMision = -1 Entonces
							Escribir "[ERROR] La mision no existe o ya esta controlada."
						FinSi
					FinSi
				Hasta Que posMision <> -1 O idMisionBuscada = "0"
				
				Si posMision <> -1 Entonces
					Si cantidadTrabajadoresPorMision[posMision] >= maximoTrabajadoresPorMision Entonces
						Escribir "[ERROR] La mision ", idMision[posMision], " ya tiene el maximo de ", maximoTrabajadoresPorMision, " trabajadores."
					SiNo
						// ---- Listado de trabajadores con su situacion ----
						Escribir ""
						Escribir "LISTA DE TRABAJADORES:"
						Escribir "----------------------------------------------------------"
						Para i <- 0 Hasta cantidadTrabajadores - 1 Con Paso 1 Hacer
							misionOcupada <- misionDeTrabajador(trabajadorAsignado, misionAsignada, cantidadAsignaciones, idTrabajador[i])
							Si misionOcupada = "" Entonces
								Escribir idTrabajador[i], " - ", nombreTrabajador[i], " ", apellidoTrabajador[i], " (libre)"
							SiNo
								Escribir idTrabajador[i], " - ", nombreTrabajador[i], " ", apellidoTrabajador[i], " (en mision ", misionOcupada, ")"
							FinSi
						FinPara
						Escribir "----------------------------------------------------------"
						
						posTrabajador <- -1
						Repetir
							Escribir "Ingrese ID del trabajador a asignar (ej: T02) o 0 para cancelar: "
							Leer idTrabajadorBuscado
							idTrabajadorBuscado <- Mayusculas(idTrabajadorBuscado)
							Si idTrabajadorBuscado <> "0" Entonces
								Para i <- 0 Hasta cantidadTrabajadores - 1 Con Paso 1 Hacer
									Si idTrabajador[i] = idTrabajadorBuscado Entonces
										posTrabajador <- i
									FinSi
								FinPara
								Si posTrabajador = -1 Entonces
									Escribir "[ERROR] Ese trabajador no existe."
								FinSi
							FinSi
						Hasta Que posTrabajador <> -1 O idTrabajadorBuscado = "0"
						
						Si posTrabajador <> -1 Entonces
							misionOcupada <- misionDeTrabajador(trabajadorAsignado, misionAsignada, cantidadAsignaciones, idTrabajador[posTrabajador])
							Si misionOcupada <> "" Entonces
								Escribir "[ERROR] El trabajador ", idTrabajador[posTrabajador], " ya esta asignado a la mision ", misionOcupada, "."
							SiNo
								Escribir ""
								Escribir "+----------------------------------------------------------+"
								Escribir "|                   CONFIRMAR ASIGNACION                   |"
								Escribir "+----------------------------------------------------------+"
								Escribir "| Mision  : ", idMision[posMision]
								Escribir "| Personal: ", idTrabajador[posTrabajador], " - ", nombreTrabajador[posTrabajador], " ", apellidoTrabajador[posTrabajador]
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
									Si cantidadAsignaciones >= maximoAsignaciones Entonces
										Escribir "[ERROR] Se alcanzo el limite de asignaciones."
									SiNo
										misionAsignada[cantidadAsignaciones] <- idMision[posMision]
										trabajadorAsignado[cantidadAsignaciones] <- idTrabajador[posTrabajador]
										cantidadAsignaciones <- cantidadAsignaciones + 1
										cantidadTrabajadoresPorMision[posMision] <- cantidadTrabajadoresPorMision[posMision] + 1
										Escribir "[OK] Trabajador ", idTrabajador[posTrabajador], " asignado a la mision ", idMision[posMision]
										Escribir "Ahora la mision tiene ", cantidadTrabajadoresPorMision[posMision], " trabajador(es)."
									FinSi
								SiNo
									Escribir "[X] Asignacion cancelada."
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinSi
FinSubProceso

// ======================================= Stock
SubProceso gestionarStock(stockId, stockNombre, stockCategoria, stockCantidad, stockUnidad, stockEstado, totalStock Por Referencia, acumuladoDonaciones Por Referencia)
	Definir opStock, filaMod, j, cantCompra, costoUnitario, costoTotal Como Entero
	Definir nuevoEstado Como Caracter
	
	Repetir
		Borrar Pantalla
		Escribir "--- GESTION DE STOCK E INSUMOS ---"
		Escribir "Fondos disponibles para compras: $", acumuladoDonaciones
		Escribir "------------------------------------------------------------"
		Para j <- 1 Hasta totalStock Con Paso 1 Hacer
			Escribir "[", j, "] ", stockId[j], " | ", stockNombre[j], " | ", stockCategoria[j], " | ", stockCantidad[j], " ", stockUnidad[j], " | ", stockEstado[j]
		FinPara
		Escribir "------------------------------------------------------------"
		Escribir ""
		Escribir "[1] Modificar cantidad y estado de un insumo"
		Escribir "[2] Agregar un nuevo insumo"
		Escribir "[3] Comprar insumo con los fondos disponibles"
		Escribir "[4] Volver al menu principal"
		Escribir "Seleccione una opcion: "
		Leer opStock
		
		Segun opStock Hacer
			1:
				Escribir "Ingrese el numero del insumo a modificar (1 al ", totalStock, "): "
				Leer filaMod
				Si filaMod >= 1 Y filaMod <= totalStock Entonces
					Escribir "Insumo seleccionado: ", stockNombre[filaMod]
					Escribir "Ingrese la nueva cantidad actual: "
					Leer stockCantidad[filaMod]
					Repetir
						Escribir "Ingrese el nuevo estado (Optimo / Bajo / Critico): "
						Leer nuevoEstado
						Si Mayusculas(nuevoEstado) <> "OPTIMO" Y Mayusculas(nuevoEstado) <> "BAJO" Y Mayusculas(nuevoEstado) <> "CRITICO" Entonces
							Escribir "[ERROR] Estado invalido."
						FinSi
					Hasta Que Mayusculas(nuevoEstado) = "OPTIMO" O Mayusculas(nuevoEstado) = "BAJO" O Mayusculas(nuevoEstado) = "CRITICO"
					stockEstado[filaMod] <- nuevoEstado
					Escribir "[OK] Stock actualizado correctamente."
				SiNo
					Escribir "[ERROR] Numero de insumo invalido."
				FinSi
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			2:
				Si totalStock < 10 Entonces
					totalStock <- totalStock + 1
					Escribir "--- AGREGAR NUEVO INSUMO ---"
					Escribir "Ingrese ID (ej: S06): "
					Leer stockId[totalStock]
					Escribir "Ingrese nombre del insumo: "
					Leer stockNombre[totalStock]
					Escribir "Ingrese categoria (Hidratacion/Alimentacion/Medicamentos/Rescate/Comunicacion/Ropa): "
					Leer stockCategoria[totalStock]
					Escribir "Ingrese cantidad: "
					Leer stockCantidad[totalStock]
					Escribir "Ingrese unidad de medida (lts/kg/uds): "
					Leer stockUnidad[totalStock]
					Escribir "Ingrese estado (Optimo/Bajo/Critico): "
					Leer stockEstado[totalStock]
					Escribir "[OK] Nuevo insumo agregado al stock."
				SiNo
					Escribir "[ERROR] Se alcanzo el limite maximo de 10 insumos."
				FinSi
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			3:
				Si acumuladoDonaciones <= 0 Entonces
					Escribir "[ERROR] No hay fondos disponibles. Finanzas debe registrar donaciones."
				SiNo
					Escribir "Ingrese el numero del insumo a comprar (1 al ", totalStock, "): "
					Leer filaMod
					Si filaMod >= 1 Y filaMod <= totalStock Entonces
						Escribir "Insumo: ", stockNombre[filaMod]
						Escribir "Costo por unidad ($): "
						Leer costoUnitario
						Escribir "Cantidad a comprar: "
						Leer cantCompra
						Si costoUnitario > 0 Y cantCompra > 0 Entonces
							costoTotal <- costoUnitario * cantCompra
							Escribir "Costo total: $", costoTotal
							Si costoTotal <= acumuladoDonaciones Entonces
								acumuladoDonaciones <- acumuladoDonaciones - costoTotal
								stockCantidad[filaMod] <- stockCantidad[filaMod] + cantCompra
								Escribir "[OK] Compra realizada."
								Escribir "Nuevo stock de ", stockNombre[filaMod], ": ", stockCantidad[filaMod], " ", stockUnidad[filaMod]
								Escribir "Fondos restantes: $", acumuladoDonaciones
							SiNo
								Escribir "[ERROR] Fondos insuficientes. Disponible: $", acumuladoDonaciones
							FinSi
						SiNo
							Escribir "[ERROR] Costo y cantidad deben ser mayores a 0."
						FinSi
					SiNo
						Escribir "[ERROR] Numero de insumo invalido."
					FinSi
				FinSi
				Escribir "Presione una tecla para continuar..."
				Esperar Tecla
				
			4:
				Escribir "Volviendo..."
				
			De Otro Modo:
				Escribir "Opcion invalida."
				Esperar Tecla
		FinSegun
	Hasta Que opStock = 4
FinSubProceso

// ==========================================================
//                        COLABORADOR
// ==========================================================

//FALTA - Unificar la parte de colaboradores, usando vectores
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

//FALTA - Pasar lo que queda a vectores!
SubProceso finanzas(idFinanzas, acumuladoDonaciones Por Referencia, idMision, tipoMision, provinciaMision, estadoMision, cantidadMisiones, donacionesPorMision)
	Definir opFinanzas, monto, cantDistribuir, i, posMision, totalDistribuido Como Entero
	Definir idMisionDestino, confirmacion Como Caracter
	
	Repetir
		Limpiar Pantalla
		Escribir " ================ PANEL DE FINANZAS ================ "
		Escribir "ID: ", idFinanzas
		Escribir "Fondos disponibles para distribuir: $", acumuladoDonaciones
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
				Escribir "Fondos pendientes de distribucion: $", acumuladoDonaciones
				Escribir ""
				Escribir "Fondos asignados por mision:"
				Escribir "-----------------------------------------------------"
				totalDistribuido <- 0
				Si cantidadMisiones = 0 Entonces
					Escribir "No hay misiones registradas."
				SiNo
					Para i <- 0 Hasta cantidadMisiones - 1 Con Paso 1 Hacer
						Escribir idMision[i], " | ", tipoMision[i], " | ", estadoMision[i], " | Recibido: $", donacionesPorMision[i]
						totalDistribuido <- totalDistribuido + donacionesPorMision[i]
					FinPara
				FinSi
				Escribir "-----------------------------------------------------"
				Escribir "Total ya distribuido: $", totalDistribuido
				Escribir "Total recaudado (distribuido + pendiente): $", totalDistribuido + acumuladoDonaciones
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
					Escribir "[OK] Donacion registrada. Fondos disponibles: $", acumuladoDonaciones
				SiNo
					Escribir "[ERROR] El monto debe ser mayor a 0."
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
						Escribir "Fondos disponibles: $", acumuladoDonaciones
						Escribir ""
						Escribir "MISIONES ACTIVAS:"
						Escribir "-----------------------------------------------------"
						Para i <- 1 Hasta cantidadMisiones Con Paso 1 Hacer
							Si estadoMision[i] <> "Controlada" Entonces
								Escribir idMision[i], " | ", tipoMision[i], " | ", provinciaMision[i], " | Recibido: $", donacionesPorMision[i]
							FinSi
						FinPara
						Escribir "-----------------------------------------------------"
						Escribir "Ingrese el ID de la mision destino (ej: M01): "
						Leer idMisionDestino
						idMisionDestino <- Mayusculas(idMisionDestino)
						
						// Busca la mision (solo las activas)
						posMision <- -1
						Para i <- 0 Hasta cantidadMisiones - 1 Con Paso 1 Hacer
							Si idMision[i] = idMisionDestino Y estadoMision[i] <> "Controlada" Entonces
								posMision <- i
							FinSi
						FinPara
						
						Si posMision = -1 Entonces
							Escribir "[ERROR] La mision no existe o ya esta controlada."
						SiNo
							Escribir "Cantidad a enviar a ", idMisionDestino, " (maximo ", acumuladoDonaciones, "): "
							Leer cantDistribuir
							
							Si cantDistribuir > 0 Y cantDistribuir <= acumuladoDonaciones Entonces
								Repetir
									Escribir "Confirmar envio de $", cantDistribuir, " a ", idMisionDestino, "? (S/N): "
									Leer confirmacion
									confirmacion <- Mayusculas(confirmacion)
									Si confirmacion <> "S" Y confirmacion <> "N" Entonces
										Escribir "[ERROR] Opcion invalida. Debe ingresar S o N."
									FinSi
								Hasta Que confirmacion = "S" O confirmacion = "N"
								
								Si confirmacion = "S" Entonces
									acumuladoDonaciones <- acumuladoDonaciones - cantDistribuir
									donacionesPorMision[posMision] <- donacionesPorMision[posMision] + cantDistribuir
									Escribir ""
									Escribir "[OK] Se enviaron $", cantDistribuir, " a la mision ", idMisionDestino
									Escribir "La mision ya acumula: $", donacionesPorMision[posMision]
									Escribir "Fondos restantes en Finanzas: $", acumuladoDonaciones
								SiNo
									Escribir "[X] Distribucion cancelada."
								FinSi
							SiNo
								Escribir "[ERROR] Cantidad invalida o supera los fondos disponibles."
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

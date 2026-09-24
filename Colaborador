// 1. Funcion para mostrar solo las misiones publicas (Base 1)
Funcion VerMisionesPublicas(matrizMisiones, cantidadMisiones)
	Definir i Como Entero
	Definir hayPublicas Como Logico
	
	i <- 1
	hayPublicas <- Falso
	
	Escribir "======== MISIONES PUBLICAS DISPONIBLES ========"
	Escribir ""
	
	Para i <- 1 Hasta cantidadMisiones Hacer
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
	FinSi
	Escribir ""
FinFuncion

// 2. Funcion para simular donaciones de insumos (Base 1)
Funcion SimularDonacionInsumos(matrizMisiones, cantidadMisiones)
	Definir i Como Entero
	Definir idBuscado Como Cadena
	Definir insumo Como Cadena
	Definir cantidad Como Entero
	Definir encontrada Como Logico
	Definir indiceEncontrado Como Entero
	
	i <- 1
	idBuscado <- ""
	insumo <- ""
	cantidad <- 0
	encontrada <- Falso
	indiceEncontrado <- 0
	
	// Muestra primero el listado de misiones publicas
	VerMisionesPublicas(matrizMisiones, cantidadMisiones)
	
	Escribir "======== SIMULACION DE DONACION DE INSUMOS ========"
	Escribir "Ingrese el ID de la mision a la que desea donar: "
	Leer idBuscado
	
	// Busca la mision ingresada verificando que sea PUBLICA
	Para i <- 1 Hasta cantidadMisiones Hacer
		Si matrizMisiones[i, 1] = idBuscado Y Mayusculas(matrizMisiones[i, 3]) = "PUBLICA" Entonces
			encontrada <- Verdadero
			indiceEncontrado <- i
		FinSi
	FinPara
	
	Si encontrada Entonces
		Escribir "Mision seleccionada: ", matrizMisiones[indiceEncontrado, 2]
		Escribir ""
		
		Escribir "Ingrese el insumo a donar (ej: Agua, Mantas, Ropa): "
		Leer insumo
		
		Escribir "Ingrese la cantidad a donar: "
		Leer cantidad
		
		Si cantidad > 0 Entonces
			Escribir ""
			Escribir "---------------------------------------------"
			Escribir "     DONACION REGISTRADA CON EXITO (SIMULACION)"
			Escribir "---------------------------------------------"
			Escribir "Mision ID    : ", matrizMisiones[indiceEncontrado, 1]
			Escribir "Mision Titulo: ", matrizMisiones[indiceEncontrado, 2]
			Escribir "Insumo       : ", insumo
			Escribir "Cantidad     : ", cantidad
			Escribir "¡Gracias por colaborar con la causa!"
			Escribir "---------------------------------------------"
		Sino
			Escribir "La cantidad ingresada debe ser mayor a 0."
		FinSi
	Sino
		Escribir "No se encontro ninguna mision PUBLICA con el ID ingresado."
	FinSi
	Escribir ""
FinFuncion

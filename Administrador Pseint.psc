Algoritmo Administrador
    //en C usare archivos para esto pero como en pseint no se puede improvise y use vectores
	Definir coordinadores, trabajadores Como Caracter
    Dimension coordinadores[100], trabajadores[100]
	
    Definir cantCoord, cantTrab Como Entero
    Definir opcion, tipo, i, j Como Entero
    Definir nombre Como Caracter
    Definir encontrado Como Logico
	
    cantCoord <- 0
    cantTrab <- 0
    Repetir
        Escribir "===================================================="
        Escribir "              SISTEMA DE ADMINISTRACION             "
        Escribir "===================================================="
        Escribir ""
        Escribir "                 MENU ADMINISTRADOR"
        Escribir "----------------------------------------------------"
        Escribir "  [1]  Dar de alta"
        Escribir "  [2]  Dar de baja"
        Escribir "  [3]  Mostrar Coordinadores"
        Escribir "  [4]  Mostrar Trabajadores"
        Escribir "  [0]  Salir"
        Escribir "----------------------------------------------------"
        Escribir "  Seleccione una opcion: " Sin Saltar
        Leer opcion
        Escribir ""
		
        Segun opcion Hacer
			
            1:
                Escribir "===================================================="
                Escribir "                    DAR DE ALTA"
                Escribir "===================================================="
                Escribir ""
                Escribir "  [1] Coordinador"
                Escribir "  [2] Trabajador"
                Escribir ""
                Escribir "  Seleccione una opcion: " Sin Saltar
                Leer tipo
                Escribir ""
				
                Si tipo = 1 Entonces
                    Escribir "----------------------------------------------------"
                    Escribir "  Ingrese el nombre del coordinador:"
                    Escribir "  > " Sin Saltar
                    Leer nombre
					
                    cantCoord <- cantCoord + 1
                    coordinadores(cantCoord) <- nombre
					
                    Escribir ""
                    Escribir "  +----------------------------------------------+"
                    Escribir "  |  COORDINADOR REGISTRADO CORRECTAMENTE       |"
                    Escribir "  +----------------------------------------------+"
					
                Sino
                    Si tipo = 2 Entonces
                        Escribir "----------------------------------------------------"
                        Escribir "  Ingrese el nombre del trabajador:"
                        Escribir "  > " Sin Saltar
                        Leer nombre
						
                        cantTrab <- cantTrab + 1
                        trabajadores(cantTrab) <- nombre
						
                        Escribir ""
                        Escribir "  +----------------------------------------------+"
                        Escribir "  |  TRABAJADOR REGISTRADO CORRECTAMENTE        |"
                        Escribir "  +----------------------------------------------+"
						
                    Sino
                        Escribir ""
                        Escribir "  [!] OPCION INVALIDA."
                    FinSi
                FinSi
				
				
            2:
                Escribir "===================================================="
                Escribir "                    DAR DE BAJA"
                Escribir "===================================================="
                Escribir ""
                Escribir "  [1] Coordinador"
                Escribir "  [2] Trabajador"
                Escribir ""
                Escribir "  Seleccione una opcion: " Sin Saltar
                Leer tipo
                Escribir ""
				
                Si tipo = 1 Entonces
					
                    Si cantCoord <> 0 Entonces
                        Escribir "----------------------------------------------------"
                        Escribir "  Ingrese el nombre del coordinador:"
                        Escribir "  > " Sin Saltar
                        Leer nombre
						
                        encontrado <- Falso
						
                        Para i <- 1 Hasta cantCoord Hacer
                            Si coordinadores(i) = nombre Entonces
                                encontrado <- Verdadero
								
                                Para j <- i Hasta cantCoord - 1 Hacer
                                    coordinadores(j) <- coordinadores(j + 1)
                                FinPara
								
                                cantCoord <- cantCoord - 1
								
                                Escribir ""
                                Escribir "  +----------------------------------------------+"
                                Escribir "  |  COORDINADOR ELIMINADO CORRECTAMENTE       |"
                                Escribir "  +----------------------------------------------+"
                            FinSi
                        FinPara
						
                        Si encontrado = Falso Entonces
                            Escribir ""
                            Escribir "  [!] No existe un coordinador con ese nombre."
                        FinSi
						
                    SiNo
                        Escribir "  [!] No hay coordinadores registrados."
                    FinSi
					
                Sino
					
                    Si tipo = 2 Entonces
						
                        Si cantTrab <> 0 Entonces
                            Escribir "----------------------------------------------------"
                            Escribir "  Ingrese el nombre del trabajador:"
                            Escribir "  > " Sin Saltar
                            Leer nombre
							
                            encontrado <- Falso
							
                            Para i <- 1 Hasta cantTrab Hacer
                                Si trabajadores(i) = nombre Entonces
                                    encontrado <- Verdadero
									
                                    Para j <- i Hasta cantTrab - 1 Hacer
                                        trabajadores(j) <- trabajadores(j + 1)
                                    FinPara
									
                                    cantTrab <- cantTrab - 1
									
                                    Escribir ""
                                    Escribir "  +----------------------------------------------+"
                                    Escribir "  |  TRABAJADOR ELIMINADO CORRECTAMENTE        |"
                                    Escribir "  +----------------------------------------------+"
                                FinSi
                            FinPara
							
                            Si encontrado = Falso Entonces
                                Escribir ""
                                Escribir "  [!] No existe un trabajador con ese nombre."
                            FinSi
							
                        SiNo
                            Escribir "  [!] No hay trabajadores registrados."
                        FinSi
						
                    Sino
                        Escribir "  [!] OPCION INVALIDA."
                    FinSi
					
                FinSi
				
				
            3:
                Escribir "===================================================="
                Escribir "                  COORDINADORES"
                Escribir "===================================================="
				
                Si cantCoord <> 0 Entonces
                    Para i <- 1 Hasta cantCoord Hacer
                        Escribir "  | ", i, ". ", coordinadores(i)
                    FinPara
					
                    Escribir "----------------------------------------------------"
                    Escribir "  Total de coordinadores: ", cantCoord
                SiNo
                    Escribir ""
                    Escribir "  [!] Hay 0 coordinadores registrados."
                FinSi
				
				
            4:
                Escribir "===================================================="
                Escribir "                   TRABAJADORES"
                Escribir "===================================================="
				
                Si cantTrab <> 0 Entonces
                    Para i <- 1 Hasta cantTrab Hacer
                        Escribir "  | ", i, ". ", trabajadores(i)
                    FinPara
					
                    Escribir "----------------------------------------------------"
                    Escribir "  Total de trabajadores: ", cantTrab
                SiNo
                    Escribir ""
                    Escribir "  [!] Hay 0 trabajadores registrados."
                FinSi
				
				
            0:
                Escribir "===================================================="
                Escribir "             CERRANDO SISTEMA..."
                Escribir "===================================================="
				
            De Otro Modo:
                Escribir ""
                Escribir "  [!] OPCION INVALIDA."
				
        FinSegun
		
        Si opcion <> 0 Entonces
            Escribir ""
            Escribir "----------------------------------------------------"
            Escribir "  Toque una tecla para continuar..."
            Escribir "----------------------------------------------------"
            Esperar Tecla
            Borrar Pantalla
        FinSi
		
    Hasta Que opcion = 0
	
FinAlgoritmo
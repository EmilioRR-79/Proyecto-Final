Algoritmo PROYECTO_NOMINA
	
	Definir num_areas, a, num_empleados, e Como Entero
	Definir sueldo_diario, dias_laborados, faltas Como Real
	Definir total_dias_laborados, descuento_faltas, pago_descanso, pago_festivo Como Real
	Definir vueltas_lunes, vueltas_martes, vueltas_miercoles, vueltas_jueves, vueltas_viernes, vueltas_sabado, vueltas_domingo Como Entero
	Definir bono_total_vueltas, descuento_adicional Como Real 
	Definir BASE, PRETOTAL, IMSS, INFONAVIT, ISR, total_deducciones, TOTAL_NETO, total_general, total_area Como Real
	Definir nombre, puesto, descanso, festivo, horas_extras, vueltas_input, desc_adic_input Como Caracter
	
	total_general <- 0
	
	Escribir "---------------------------------------------"
	Escribir "-----<- CALCULO DE NOMINA GENERAL ->-----"
	Escribir "---------------------------------------------"
	Escribir "Ingrese el número de terminales o áreas a capturar:"
	Leer num_areas
	
	//áreas
	Para a <- 1 Hasta num_areas Con Paso 1 Hacer
		
		total_area <- 0
		Limpiar Pantalla
		Escribir "---------------------------------------------"
		Escribir "-----<- ÁREA: ", a, " ->-----"
		Escribir "---------------------------------------------"
		Escribir "Ingrese el número de empleados a capturar (Ej: 2):"
		Leer num_empleados
		
		// empleados
		Para e <- 1 Hasta num_empleados Con Paso 1 Hacer
			
			// Reiniciar valores para cada empleado
			bono_asistencia <- 0
			bono_total_vueltas <- 0
			horas_extrastotal <- 0
			pago_descanso <- 0 
			pago_festivo <- 0 
			descuento_faltas <- 0
			descuento_adicional <- 0 
			
			Limpiar Pantalla
			Escribir "----------------------------------------------------------------"
			Escribir "-----<- CAPTURA DE DATOS DEL EMPLEADO ", e, " DEL ÁREA ", a, " ->-----"
			Escribir "----------------------------------------------------------------"
			
			Escribir "Nombre del empleado:"
			Leer nombre
			
			Escribir "Puesto (Ej: Chofer Operador, Checador, Mecanico, Nominas):"
			Leer puesto
			puesto_normalizado <- Minusculas(puesto)
			
			Escribir "Sueldo diario:"
			Leer sueldo_diario
			
			Escribir "Días laborados (0 a 7):"
			Leer dias_laborados
			
			Si dias_laborados < 0 O dias_laborados > 7 Entonces
				dias_laborados <- 0
			FinSi
			
			total_dias_laborados <- sueldo_diario * dias_laborados
			
			
			
			Escribir "Ingrese número de faltas:"
			Leer faltas
			descuento_faltas <- faltas * sueldo_diario
			
			Si puesto="Chofer Operador" y dias_laborados = 7 Y faltas = 0 Entonces
				bono_asistencia <- 125
			FinSi
			
			
			Escribir "¿Trabajó día de descanso? (Si/No)"
			Leer descanso
			Si Minusculas(descanso) = "si" Entonces
				Si puesto_normalizado = "chofer operador" Entonces
					pago_descanso <- 375 
				SiNo
					Escribir "Monto del pago por día de descanso para ", puesto, ":"
					Leer pago_descanso
				FinSi
			FinSi
			
			Escribir "¿Trabajó día festivo? (Si/No)"
			Leer festivo
			Si Minusculas(festivo) = "si" Entonces
				Si puesto_normalizado = "chofer operador" Entonces
					pago_festivo <- sueldo_diario * 2 
				SiNo 
					Escribir "Monto del pago por día festivo para ", puesto, ":"
					Leer pago_festivo
				FinSi
			FinSi
			
			Escribir "¿Trabajó horas extras? (Si/No)"
			Leer horas_extras
			Si Minusculas(horas_extras) = "si" Entonces
				Escribir "Ingrese el número de horas extras trabajadas:"
				Leer Definicion_horas_extra
				Escribir "Ingrese el monto TOTAL a pagar por esas horas extras:"
				Leer horas_extrastotal 
			FinSi
			
			Si puesto_normalizado = "chofer operador" Entonces
				Escribir "¿Desea capturar el subtotal de bonos por vueltas? (Si/No)"
				Leer vueltas_input
				Si Minusculas(vueltas_input) = "si" Entonces
					Escribir "Ingrese el subtotal de bonos por vueltas:"
					Leer bono_total_vueltas
				FinSi
			FinSi
			
			Escribir "¿Tiene Descuento Adicional? (Si/No)"
			Leer desc_adic_input
			Si Minusculas(desc_adic_input) = "si" Entonces
				Escribir "Ingrese el monto del Descuento Adicional:"
				Leer descuento_adicional
			FinSi
			
			
			BASE <- total_dias_laborados + pago_descanso + pago_festivo + bono_asistencia - descuento_faltas
			
			PRETOTAL <- BASE + bono_total_vueltas + horas_extrastotal
			
			IMSS <- total_dias_laborados * 0.02
			INFONAVIT <- total_dias_laborados * 0.05
			
			ISR <- 745.56 
			
			total_deducciones <- IMSS + INFONAVIT + ISR + descuento_adicional
			
			TOTAL_NETO <- PRETOTAL - total_deducciones
			
			
			
			Borrar Pantalla
			Escribir "--------------------------------------------------------"
			Escribir "-----<- RESUMEN DE NOMINA DEL EMPLEADO: ", nombre, " ->-----"
			Escribir "--------------------------------------------------------"
			Escribir "Puesto:", puesto
			Escribir "Sueldo Diario:", sueldo_diario
			Escribir "Días Laborados:", dias_laborados
			Escribir "Faltas:", faltas
			Escribir "--------------------------------------------------------"
			
			Escribir "--- RESUMEN DEL EMPLEADO ---"
			Escribir "Total Días Laborados (Sueldo): $", total_dias_laborados
			Escribir "Pago Día Descanso: $", pago_descanso
			Escribir "Pago Día Festivo: $", pago_festivo
			Escribir "Bono Asistencia: $", bono_asistencia
			Escribir "Pago Horas Extras: $", horas_extrastotal
			Escribir "Bono por Vueltas: $", bono_total_vueltas
			Escribir "PRETOTAL (Percepciones Totales): $", PRETOTAL
			Escribir "--------------------------------------------------------"
			
			Escribir "--- DEDUCCIONES ---"
			Escribir "Descuento por Faltas: $", descuento_faltas, " (Restado de la BASE)"
			Escribir "ISR: $", ISR
			Escribir "IMSS (2%): $", IMSS
			Escribir "INFONAVIT (5%): $", INFONAVIT
			Escribir "Descuento Adicional: $", descuento_adicional
			Escribir "TOTAL DEDUCCIONES (IMSS+INF+ISR+ADICIONAL): $", total_deducciones
			Escribir "--------------------------------------------------------"
			
			Escribir "TOTAL NETO A PAGAR: $", TOTAL_NETO
			
			total_area <- total_area + TOTAL_NETO
			Escribir "Presione una tecla para continuar y capturar el siguiente empleado"
			Esperar Tecla
			
		Fin Para
		
		Limpiar Pantalla
		Escribir "---------------------------------------------"
		Escribir "TOTAL NETO DEL ÁREA ", a, ": $", total_area
		Escribir "---------------------------------------------"
		total_general <- total_general + total_area
		Escribir "Presione una tecla para continuar"
		Esperar Tecla
		
	Fin Para
	
	Limpiar Pantalla
	Escribir "---------------------------------------------"
	Escribir "           RESUMEN FINAL DE NÓMINAS"
	Escribir "---------------------------------------------"
	Escribir "TOTAL GENERAL DE LA NÓMINA: $", total_general
	Escribir "---------------------------------------------"
	
FinAlgoritmo
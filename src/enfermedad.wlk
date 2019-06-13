object muerte {
	method atenuar() {}
	
	method afectarA(paciente) {
		paciente.congelar()
	}
	method estaCurada() = false
	
	method esAgresiva(paciente) = true
}

class Enfermedad {
	var celulasAmenazadas
	
	method atenuar(cantidad) {
		celulasAmenazadas -=cantidad
	}
	
	method estaCurada() = celulasAmenazadas <= 0
	
}

class EnfermedadInfecciosa inherits Enfermedad {
	
	method afectarA(paciente){
		paciente.aumentarTemperatura(celulasAmenazadas/1000)
	}
	method reproducir(){
		celulasAmenazadas = celulasAmenazadas * 2 
	}
	method esAgresiva(paciente) 
	   = celulasAmenazadas > paciente.celulas()
}

class EnfermedadAutoinmune inherits Enfermedad {
	var dias = 0 
	
	method afectarA(paciente){
		paciente.destruirCelulas(celulasAmenazadas)
		dias++
	}
	method esAgresiva(paciente) = dias > 30 
}

object varicela inherits EnfermedadAutoinmune(celulasAmenazadas = 2000) {

	override method esAgresiva(paciente) 
		= super(paciente) && celulasAmenazadas > 100
}

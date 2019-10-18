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

class EnfermedadInfecciosa inherits Enfermedad{
	method afectarA(paciente){
		paciente.aumentarTemperatura(celulasAmenazadas/1000)
	}
	method reproducir(){
		celulasAmenazadas *= 2 
	}
	method esAgresiva(paciente) 
	   = celulasAmenazadas > paciente.celulas()
}

class EnfermedadAutoinmune inherits Enfermedad {
	var dias = 0 
	
	method afectarA(paciente){
		paciente.destruirCelulas(celulasAmenazadas)
		dias += 1
	}
	method esAgresiva(paciente) = dias > 30 
}

class Varicela inherits EnfermedadAutoinmune {

	override method esAgresiva(paciente) 
		= super(paciente) || celulasAmenazadas > 100
}

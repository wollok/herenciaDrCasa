object muerte {
	method atenuar() {}
	
	method afectarA(paciente) {
		paciente.congelar()
	}
	method estaViva() = true
	
}

class Enfermedad {
	var celulasAmenazadas
	
	constructor(c) {
		celulasAmenazadas= c
	}
	
	method atenuar(cantidad) {
		celulasAmenazadas -=cantidad
	}
	
	method estaViva() = celulasAmenazadas > 0
	
	

	
}

class EnfermedadInfecciosa inherits Enfermedad {
	
	method afectarA(paciente){
		paciente.aumentarTemperatura(celulasAmenazadas/1000)
	}
	method reproducir(){
		celulasAmenazadas = celulasAmenazadas * 2 
	}
	
}

class EnfermedadAutoinmune inherits Enfermedad {
	
	method afectarA(paciente){
		paciente.destruirCelulas(celulasAmenazadas)
	}
	
}
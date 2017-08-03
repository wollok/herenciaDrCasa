
class Enfermedad {
	var celulasAmenazadas
	
	constructor(c) {
		celulasAmenazadas= c
	}
	
	method atenuar(cantidad) {
		celulasAmenazadas -=cantidad
	}
	method domingo(paciente){
		self.afectarA(paciente)
		self.afectarA(paciente)
		self.atenuar(10)
	}
	
	method afectarA(paciente)
	
}

class EnfermedadInfecciosa inherits Enfermedad {
	
	override method afectarA(paciente){
		paciente.aumentarTemperatura(celulasAmenazadas/1000)
	}
	method reproducir(){
		celulasAmenazadas = celulasAmenazadas * 2 
	}
	
}

class EnfermedadAutoinmune inherits Enfermedad {
	
	override method afectarA(paciente){
		paciente.destruirCelulas(celulasAmenazadas)
	}
	
}
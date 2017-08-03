class Persona {
	var celulas
	var temperatura
	var enfermedades = []
	
	constructor(c,t) {
		celulas = c
		temperatura = t
	}
	constructor(c) = self(c,0) 
	
	method contraer(enfermedad){
		enfermedades.add(enfermedad)
	}
	method pasarUnDia(){
		enfermedades.forEach({enf => enf.afectarA(self)})
	}
	method aumentarTemperatura(grados){
		temperatura +=grados
	}
	method destruirCelulas(cant){
		celulas -= cant
	}
	method recibirMedicamento(dosis){
		enfermedades.forEach({enf => enf.atenuar(dosis*15)})
	}
}

class Medico inherits Persona{
	var dosis
	
	constructor(c,t,d) = super(c,t) {
		dosis = d
	}
	
	method atenderA(paciente) {
		paciente.recibirMedicamento(dosis)	
	}
	override method contraer(enfermedad){
		super(enfermedad) 
		self.atenderA(self)	
	}
}

class Jefe inherits Medico{
	var empleados = []

	override method atenderA(paciente) {
		empleados.head().atenderA(paciente) 
	}
	method contratar(empleado){
		empleados.add(empleado)
	}	
}

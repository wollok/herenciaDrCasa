class SinEmpleadosException inherits Exception {}

class Persona {
	var celulas
	var temperatura
	var enfermedades = []
	
	constructor(c,t) {
		celulas = c
		temperatura = t
	}
	constructor(c) = self(c,37) 
	
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
		enfermedades = enfermedades.filter{enf=>enf.estaViva()}
	}
	method celulas() = celulas
	method temperatura() = temperatura
	
	method estaCurada() = enfermedades.isEmpty()
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
		if (empleados.isEmpty()) {
			throw new SinEmpleadosException("Un jefe sin empleados no puede atender pacientes")
		}
		empleados.anyOne().atenderA(paciente) 
	}
	method contratar(empleado){
		empleados.add(empleado)
	}	
}

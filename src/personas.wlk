import enfermedad.*

class SinEmpleadosException inherits Exception {}

class Persona {
	var property celulas
	var property temperatura = 36
	const enfermedades = []

	method contraer(enfermedad){
		if(enfermedades.size() <5)
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
		enfermedades.removeAllSuchThat{enf=>enf.estaCurada()}
	}
	method congelar() { temperatura = 0}
	
	method estaCurada() = enfermedades.isEmpty()
}

class Medico inherits Persona{
	var dosis = 0
	
	method atenderA(paciente) {
		paciente.recibirMedicamento(dosis)	
	}
	override method contraer(enfermedad){
		super(enfermedad)
		self.atenderA(self)	
	}
}

class Jefe inherits Medico{
	const empleados = []

	override method atenderA(paciente) {
		if (empleados.isEmpty()) {
			throw new SinEmpleadosException(message = "Un jefe sin empleados no puede atender pacientes")
		}
		empleados.anyOne().atenderA(paciente) 
	}
	method contratar(empleado){
		empleados.add(empleado)
	}
	
}

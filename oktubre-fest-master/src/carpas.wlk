import personas.*
import cervezas.*

class Carpa {
	const property limiteGente
	const property musicaTradicional
	const property marcaVendida
	const property personas = []
	
	method dejaIngresarA(unaPersona) {
		return
			self.limiteGente() > self.personas().size() and
			not unaPersona.estaEbria()
	}
	
	method hacerIngresarA(unaPersona) {
		self.personas().add(unaPersona)
	}
	
	method servirJarraDeA(unaCapacidad, unaPersona) {
		if (unaPersona.carpaActual() != self) {
			self.error("No le podemos servir porque no está.")
		} else {
			unaPersona.agarrarJarraServida(new Jarra(capacidad = unaCapacidad, marca = self.marcaVendida()))	
		}
	}
	
	method cuantosEmpedernidos() {
		return self.personas().count( { p => p.esEmpedernido() } )
	}
}
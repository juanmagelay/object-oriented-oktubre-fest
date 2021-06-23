import cervezas.*
import jarra.*
import personas.*

class Carpa {
	const property limiteGente
	const property musicaTradicional
	const property marcaVendida
	var property cantidadDePersonas = 0
	const property personas = []
	method dejarEntrar() {
		return limiteGente >= cantidadDePersonas + 1
	}
	method servirJarraADe(unaPersona, capacidad) {
		var jarra
		if (self.personas().contains(unaPersona)) {
			jarra = new Jarra(capacidadEnLt = capacidad, marcaDeCerveza = self.marcaVendida(), carpaQueLaSirvio = self)
			unaPersona.jarrasCompradas().add(jarra) //convertirlo en metodo de la persona comprarJarra.
		} else {
			self.error("Quién te lo pidió.")
		}
	}
	method cuantosEbriosEmpedernidos() {
		return personas.count( { p => p.esEbrioEmpedernido() } )
	}
	//SE PUEDE HACER UN METODO CANTIDAD DE PERSONAS QUE HACE SELF.PERSONAS().SIZE()
	
	method esHomogenea() { //NUEVO
		return self.personas().map( { p => p.nacionalidad() } ).asSet().size() == 1
	}
	method asistentesALosQueNoLesSirvio() { //NUEVO
		return personas.filter( { p => not p.compreCervezaEn(self) } )
	}
}

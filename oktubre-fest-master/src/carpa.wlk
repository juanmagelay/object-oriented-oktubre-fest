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
			jarra = new Jarra(capacidadEnLt = capacidad, marcaDeCerveza = self.marcaVendida())
			unaPersona.jarrasCompradas().add(jarra)
		} else {
			self.error("Quién te lo pidió.")
		}
	}
	method cuantosEbriosEmpedernidos() {
		return personas.count( { p => p.esEbrioEmpedernido() } )
	}
}

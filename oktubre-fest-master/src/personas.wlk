import personas.*
import jarra.*
import cervezas.*
import carpa.*

class Persona {
	var property peso
	const property jarrasCompradas = []
	var property musicaTradicional = false
	var property nivelDeAguante = 0
	var property nacionalidad = "argentina"
	method estaEbria() {
		return (self.totalDeAlcohol() * peso) > nivelDeAguante
	}	
	method leGustan(marcas) {
		return
			if (nacionalidad == "belga") { marcas.filter( { m => m.lupuloPorLt() > 4 } ) }
			else if (nacionalidad == "checo") { marcas.filter( { m => m.graduacionPorLt() > 0.8 } ) }
			else if (nacionalidad == "aleman") { marcas }
	}
	method totalDeAlcohol() {
		return jarrasCompradas.sum( { j => j.contenidoDeAlcohol() } )
	}
	method quiereEntrar(unaCarpa) {
		return 
			self.leGustan([unaCarpa.marcaVendida()]) == [unaCarpa.marcaVendida()] and
			unaCarpa.musicaTradicional() == self.musicaTradicional()
	}
	method puedeEntrarA(unaCarpa) {
		return 
			self.quiereEntrar(unaCarpa) and
			unaCarpa.dejarEntrar()
	}
	method entrarA(unaCarpa) {
		if (self.puedeEntrarA(unaCarpa)) {
			unaCarpa.cantidadDePersonas() == unaCarpa.cantidadDePersonas() + 1
			unaCarpa.personas().add(self)
		} else {
			self.error("Pibe, con esas zapatillas no pasás.")
		}
	}
	method esEbrioEmpedernido() {
		return self.jarrasCompradas().all( { j => j.capacidadEnLt() >= 1 } )
	}
	method esPatriota() {
		return self.jarrasCompradas().all( { j => j.marcaDeCerveza().pais() == self.nacionalidad() } )
	}
}

class Aleman inherits Persona {
	override method quiereEntrar(unaCarpa) {
		return
			super(unaCarpa) and (unaCarpa.cantidadDePersonas() % 2 == 0)
	}
}

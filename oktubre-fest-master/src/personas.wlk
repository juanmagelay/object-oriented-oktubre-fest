import personas.*
import jarra.*
import cervezas.*
import carpa.*

class Persona {
	var property peso
	const property jarrasCompradas = []
	var property musicaTradicional = false
	var property nivelDeAguante = 0
	var property nacionalidad = "argentina" //ponerlo como abstracto
	method estaEbria() {
		return (self.totalDeAlcohol() * self.peso()) > nivelDeAguante
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
			unaCarpa.cantidadDePersonas() == unaCarpa.cantidadDePersonas() + 1 //esto es mejor con un metodo en la carpa registrarIngreso(self)
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
	method esCompatible(unaPersona) { //NUEVO
		const comunes = self.marcasQueCompro().intersection(unaPersona.marcasQueCompro())
		return comunes.size() > self.marcasQueCompro().size().min(unaPersona.marcasQueCompro().size())	
	}
	method marcasQueCompro() {
		return jarrasCompradas.map( { j => j.marcaDeCerveza() } ).asSet()
	}
	method enQueCarpasEstuve() {
		return jarrasCompradas.map( { j => j.carpaQueLaSirvio() } ).asSet()
	}
}
//PASAR TODAS LAS NACIONALIDADES A CLASES HIJAS DE PERSONAS
class Aleman inherits Persona {
	//AGREGAR EL LEGUSTA(UNAMARCA)
	override method quiereEntrar(unaCarpa) {
		return
			super(unaCarpa) and (unaCarpa.cantidadDePersonas() % 2 == 0)
	}
}

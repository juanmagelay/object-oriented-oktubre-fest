import jarra.*

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
}

class Persona {
	var property peso
	const property jarrasCompradas = []
	var property musicaTradicional = false
	var property nivelDeAguante = 0
	
	method estaEbria() {
		return 
			( jarrasCompradas.sum( { j => j.marcaDeCerveza().graduacionPorLt() * j.capacidadEnLt() } ) * peso) 
			> nivelDeAguante
	}	
}

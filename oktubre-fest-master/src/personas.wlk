class Persona {
	var property peso
	const property jarrasCompradas = []
	const property musicaTradicional
	var property nivelDeAguante = 0
	
	method estaEbria() {
		return jarrasCompradas.sum( { j => j.marcaDeCerveza().graduacionPorLt() *  } ) //TERMINAR
	}	
	
}

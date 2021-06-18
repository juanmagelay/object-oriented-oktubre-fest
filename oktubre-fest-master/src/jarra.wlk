class Jarra {
	var property capacidadEnLt = 0
	var property marcaDeCerveza
	
	method contenidoDeAlcohol() {
		return capacidadEnLt * self.marcaDeCerveza().graduacionPorLt()
	}
}

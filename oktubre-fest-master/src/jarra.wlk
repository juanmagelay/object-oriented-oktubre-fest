class Jarra {
	const property capacidadEnLt = 0
	var property marcaDeCerveza //puedo eliminarla porque tengo carpaquelasirvio
	const property carpaQueLaSirvio
	
	method contenidoDeAlcohol() {
		return capacidadEnLt * self.marcaDeCerveza().graduacionPorLt()
	}
}

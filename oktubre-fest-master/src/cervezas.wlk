class MarcaDeCerveza {
	const property lupulosPorLt
	const property pais
	
	method graduacion()
}

class Rubia inherits MarcaDeCerveza {
	var graduacionRubia
	override method graduacion() { return graduacionRubia }
}

class Negra inherits MarcaDeCerveza {
	override method graduacion() {
		return graduacionReglamentaria.graduacion().min(self.lupulosPorLt() * 2)
	}	
}

class Roja inherits Negra {
	override method	graduacion() { return super() * 1.25 }
}

object graduacionReglamentaria {
	var property graduacion	
}

class Jarra {
	const property capacidad	
	const property marca
	
	method contenidoAlcohol() {
		return self.capacidad() * self.marca().graduacion()
	}
}

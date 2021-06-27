import cervezas.*

class Persona {
	const property peso
	const property jarrasCompradas = []
	const property leGustaMusica
	const property aguante
	
	method alcoholIngerido() {
		return self.jarrasCompradas().sum( { j => j.contenidoAlcohol() } )
	}
	
	method estaEbria() {
		return (self.alcoholIngerido() * self.peso()) > self.aguante()
	}
	
	method leGusta(unaMarca)
}

class Belga inherits Persona {
	override method leGusta(unaMarca) {
		return unaMarca.lupulosPorLt() > 4
	}
}

class Checo inherits Persona {
	override method leGusta(unaMarca) {
		return unaMarca.graduacion() > 0.8
	}
}

class Aleman inherits Persona {
	override method leGusta(unaMarca) { return true	}	
}



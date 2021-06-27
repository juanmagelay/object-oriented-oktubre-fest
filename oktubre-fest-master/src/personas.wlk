import cervezas.*
import carpas.*

class Persona {
	const property peso
	const property jarrasCompradas = []
	const property leGustaMusica
	const property aguante
	var property carpaActual = "Ninguna"
	
	method alcoholIngerido() {
		return self.jarrasCompradas().sum( { j => j.contenidoAlcohol() } )
	}
	
	method estaEbria() {
		return (self.alcoholIngerido() * self.peso()) > self.aguante()
	}
	
	method leGusta(unaMarca)
	method nacionalidad()
	
	method quiereEntrarA(unaCarpa) {
		return 
			self.leGusta(unaCarpa.marcaVendida()) and
			self.leGustaMusica() == unaCarpa.musicaTradicional()
	}
	
	method puedeIngresarA(unaCarpa) {
		return
			self.quiereEntrarA(unaCarpa) and
			unaCarpa.dejaIngresarA(self)
	}
	
	method ingresarA(unaCarpa) {
		if (not self.puedeIngresarA(unaCarpa)) {
			self.error("Qué bajón")
		} else {
			unaCarpa.hacerIngresarA(self)	
			self.carpaActual(unaCarpa)
		}
	}
	
	method agarrarJarraServida(unaJarra) {
		self.jarrasCompradas().add(unaJarra)
	}
	
	method esEmpedernido() {
		return self.jarrasCompradas().all( { j => j.capacidad() >= 1 } )
	}
	
	method esPatriota() {
		return self.jarrasCompradas().all( { j => j.marca().pais() == self.nacionalidad() } )
	}
}

class Belga inherits Persona {
	const property nacionalidad = "belga"
	override method leGusta(unaMarca) {
		return unaMarca.lupulosPorLt() > 4
	}
}

class Checo inherits Persona {
	const property nacionalidad = "checo"
	override method leGusta(unaMarca) {
		return unaMarca.graduacion() > 0.8
	}
}

class Aleman inherits Persona {
	const property nacionalidad = "aleman"
	override method leGusta(unaMarca) { return true	}	
	
	override method quiereEntrarA(unaCarpa) {
		return super(unaCarpa) and 
		unaCarpa.personas().size().even()
	}
}

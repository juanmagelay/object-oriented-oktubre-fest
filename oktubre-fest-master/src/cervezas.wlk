class MarcaCerveza {
	const property lupuloPorLt = 0
	const property pais
	
	var property porcentajeAlcohol = 0
	
	method graduacionPorLt() {
		return porcentajeAlcohol / 100	
	}
}

class MarcaCervezaRubia inherits MarcaCerveza {
	var graduacionPorLt = 0
	override method graduacionPorLt() {
		return graduacionPorLt	
	}	
}

class MarcaCervezaNegra inherits MarcaCerveza {
	var property graduacionMundial = 0
	
	override method graduacionPorLt() {
		return graduacionMundial.min((self.lupuloPorLt() * 2) / 100)
	}		
}

class MarcaCervezaRoja inherits MarcaCervezaNegra {
	override method graduacionPorLt() {
		return super() * 1.25
	}		
}
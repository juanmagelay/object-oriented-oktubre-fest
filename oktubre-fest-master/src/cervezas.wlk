class MarcaCerveza {
	const property lupuloPorLt
	const property pais
	var property nombre = "sin nombre" //ver
	
	method graduacionPorLt() //abstracta
}

class MarcaCervezaRubia inherits MarcaCerveza {
	const property graduacionPorLt
}

class MarcaCervezaNegra inherits MarcaCerveza {
	method graduacionMundial() {
		graduaciones.graduacionReglamentaria().min(self.lupuloPorLt() * 2)
	}
	
	override method graduacionPorLt() {
		return graduaciones.min((self.lupuloPorLt() * 2) / 100)
	}		
}

class MarcaCervezaRoja inherits MarcaCervezaNegra {
	override method graduacionPorLt() {
		return super() * 1.25
	}		
}

object graduaciones {
	var property graduacionReglamentaria
}

//PASAR TODAS LAS CERVEZAS A CLASES HIJAS DE MARCAS DE CERVEZA, CON ESTA ABSTRACTA
//AJUSTAR LO DE GRADUACION Y LUPULOS POR LT, SON LA MISMA
/* Poner en los tests.
 * 
 * var rubia1 = new MarcaCervezaRubia(lupuloPorLt = 10, pais = "Holanda", graduacionPorLt = 0.15 )
 * var negra1 = new MarcaCervezaNegra(lupuloPorLt = 10, pais = "Holanda")   negra1.graduacionMundial() == 5
 * var roja1 = new MarcaCervezaRoja(lupuloPorLt = 10, pais = "Holanda")   negra1.graduacionMundial() == 6.25
 */
 
 
 object recargoFijo() {
 	
 }
 
 object recargoCantidad() {
 	
 }
 
 object recargoEbriedad() {
 	
 }
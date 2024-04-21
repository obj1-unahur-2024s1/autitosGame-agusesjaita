import wollok.game.*
import pared.*

object autoRojo {
	// definimos los atributos para imagen y posición de nuestro elemento
	var image = "autitoRojo.png"
	var position = game.at(0,0)

	// definimos los getter y setter para poder preguntarle y cambiarle 
	// a nuestro elemento su imagen y posición. 
	method image() = image
	method position() = position
	method image(nuevaImagen) { image = nuevaImagen }
	method position(nuevaPosicion) { position = nuevaPosicion }
	
	
	method cambiarColor() {self.image("autitoVerde.png")}
	
	method chocar() {
		self.image("autoRojoCocado.jpg")
		game.say(self, "no lo cubre el seguro ;(")
	}
}

object autoAzul {
	var image = "autitoAzul.png"
	var position = game.at(13, 7)
	var x = game.width() - 1
	var y = game.height() - 1
	
	method image() = image
	method position() = position
	method image(nuevaImagen) { image = nuevaImagen }
	method position(nuevaPosicion) { position = nuevaPosicion }
	
	method derecha() {
		self.position(game.at(              // adentro de esto van las posiciones x, y nuevas
			                  x.min(self.position().x() + 1), // esta es la posicion x nueva considerando el limite a lo ancho del tablero
			                  	                              self.position().y() // esta es la posicion y
		))
	}
	method izquierda() {
		self.position(game.at(0.max(self.position().x() - 1), self.position().y()))
	}
	method arriba() {
		self.position(game.at(self.position().x(), y.min(self.position().y() + 1)))
	}
	method abajo() {
		self.position(game.at(self.position().x(), 0.max(self.position().y() - 1)))
	}
	
	method chocar() {
		self.image("autoChocado.jpg") 
		game.say(self, "no lo cubre el seguro ;(")
	}
}

object autoVerde {
	var image = "autitoVerde.png"
	var position = game.at(0, 4)
	var x = game.width() - 1
	
	method image() = image
	method position() = position
	method image(nuevaImagen) { image = nuevaImagen }
	method position(nuevaPosicion) { position = nuevaPosicion }
	
	method chocar() {
		self.image("autoVerdeChocado.jpg")
		game.removeTickEvent("autoCruzando")
	}
	
	method derecha() {self.position(game.at(x.min(self.position().x() + 1) % x, self.position().y()))
	}
}
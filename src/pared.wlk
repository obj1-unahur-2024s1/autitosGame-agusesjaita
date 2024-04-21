import wollok.game.*
import auto.*

object pared{
	var image = "paredLadrillos2.jpg"
	var position = game.at(13, 7)
	const x = (0.. game.width()-1).anyOne() 
    const y = (0.. game.height()-1).anyOne() 
	
	method image() = image
	method position() = position
	method image(nuevaImagen) { image = nuevaImagen }
	method position(nuevaPosicion) { position = nuevaPosicion }
	
	method aparecer() {
		self.position(game.at(x, y))
		game.addVisualIn(self, self.position())
	}
	
	method chocar() {
		game.removeVisual(self)
	}
}

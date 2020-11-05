extends RigidBody2D

onready var asteroidSprite= get_node("Sprite")
onready var viewPort= get_viewport().get_visible_rect().size 



#called before physics applied
func _integrate_forces(state):
	var size=asteroidSprite.texture.get_size() * asteroidSprite.scale #scales to image setup in game and not file
	var trans=state.get_transform()
	#horizontal 
	if trans.origin.x< -size.x/2: #if middle of object off screen. half cause sprite at origin 
		trans.origin.x += viewPort.x + size.x #of further to the left, move to right 
	elif trans.origin.x > viewPort.x + size.x/2:
		trans.origin.x -= viewPort.x + size.x
	#vertical
	elif trans.origin.y< -size.x/2: #if middle of object off screen. half cause sprite at origin 
		trans.origin.y += viewPort.y + size.y #of further to the left, move to right 
	elif trans.origin.y > viewPort.y + size.y/2:
		trans.origin.y -= viewPort.y + size.y
		
	state.set_transform(trans)
	pass

extends "res://Script Official/Weightless/Weightless.gd"

#break down to smaller pieces so no large
var asteroidSmall = load("res://Scenes/Asteroid Scene/AsteroidSmall .tscn")
var asteroidMedium = load("res://Scenes/Asteroid Scene/AsteroidMedium.tscn")

export(float) var explodeForce=50

signal explode

#asteroid 3 sizes 
enum Size {
	SMALL,MEDIUM,LARGE
}

export(Size) var size= Size.LARGE
var asteroidRadius

func _ready(): #called whenver node added to scene
	connect("explode",self,"_explode") #when explode sugnal received, call _explode
	asteroidRadius=get_node("Sprite").texture.get_width()/2 * get_node("Sprite").scale
	pass 
	
func _explode():
	
	if size!= Size.SMALL:
		for i in range (0,3):
			var offset= PI * 2 / 3 * i  
			var asteroid 
			match size: 
				Size.MEDIUM:
					asteroid=asteroidSmall.instance()
				Size.LARGE:
					asteroid=asteroidMedium.instance()
			asteroid.position=position + asteroidRadius.rotated(offset) #need to set placement as previous asteroid! 
			asteroid.linear_velocity=linear_velocity + Vector2(explodeForce,0).rotated(offset)
			
			get_parent().add_child(asteroid) #add to parent not self, dont want as subchild of another asteroid
	
	queue_free()
	sleeping=true
	pass

#only use when physics is NOT applied 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

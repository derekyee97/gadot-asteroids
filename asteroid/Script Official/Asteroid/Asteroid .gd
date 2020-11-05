extends "res://Script Official/Weightless/Weightless.gd"

#break down to smaller pieces so no large
#var asteroidSmall = preload("res://Scenes/Asteroid Scene/AsteroidSmall .tscn")
#var asteroidMedium = preload("res://Scenes/Asteroid Scene/AsteroidMedium.tscn")

export(float) var explodeForce=300

signal boom #explode

#asteroid 3 sizes 
enum Size {
	SMALL,MEDIUM,LARGE
}

export(Size) var size= Size.LARGE
var asteroidRadius

func _ready():
	#connect("boom",self,"_boom") #when boom sugnal received, call _boom
	asteroidRadius=get_node("Sprite").texture.get_width()/2 * get_node("Sprite").scale
	pass 
	
func _boom():
	if size != Size.SMALL:
		for i in range(0,3):
			var asteroid
			var offset_dir = PI * 2/3 * i
			#match size:  #do dif things depending on size
				#Size.MEDIUM:
				#	asteroid=asteroidSmall.instance()
				#Size.LARGE:
				#	asteroid=asteroidMedium.instance()
			#asteroid.position=position + asteroidRadius.rotated(offset_dir)
		#	asteroid.linear_velocity=linear_velocity + Vector2(explode_dir, 0).rotated(offset_dir)
		#	get_parent().add_child(asteroid)
	#queue_free() #delete
	pass



#only use when physics is NOT applied 
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

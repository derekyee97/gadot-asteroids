tool
extends Label

#because this can be motified at runtime
#setget is function to set the score and update the score can call instancely
export var level = 0 setget set_level
func _ready():
	set_level(level)
	pass # Replace with function body.
	
func set_level(newLevel):
	text = "Level: " + String(newLevel) #cast to string to concat
	level=newLevel
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

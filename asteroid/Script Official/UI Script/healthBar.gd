tool
extends GridContainer

var healthIcon = load("res://Scenes/Ui scenne/healthBar.tscn")
#because this can be motified at runtime
#setget is function to set the score and update the score can call instancely
export var health =3 setget set_health

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health(newHealth)
	pass # Replace with function body.

func set_health(newHealth):
	if get_child_count() < newHealth:
		#want to irreate from the current of chile to the decier health
		for i in range(get_child_count(), newHealth):
			#add a child
			var child = healthIcon.instance()
			add_child(child)
			pass
			
	if get_child_count() < newHealth:
		#want to irreate from the current of chile to the decier health
		for i in range(newHealth, get_child_count()):
			#remove a child
			var child = get_child(newHealth)
			removed_child(child)
			pass
			
	health = newHealth
	pass

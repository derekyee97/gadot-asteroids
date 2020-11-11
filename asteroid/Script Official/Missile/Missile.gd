extends RigidBody2D

#removed asteroid that are out of the screen
#set size of the viewport
onready var viewport = get_viewport().get_visible_rect()
# go to the tre on the current screen and find that UI
onready var ui_health = get_tree().current_scene.get_node("UI")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_max_contacts_reported(1)
	pass # Replace with function body.
func process():
	if not viewport.has_point(position):
		queue_free()
	pass
	

#seeing if missile hit something
func _integrate_forces(state):
	var contacts=state.get_contact_count()
	for i in range(contacts):
		var contact = state.get_contact_collider_object(i)
		if contact.get_script().has_script_signal("explode"):
			contact.emit_signal("explode")
			ui_health.increase_score(100)
			queue_free() #delete missile
			sleeping=true
	pass
	

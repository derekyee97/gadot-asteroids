extends Area2D

var move = Vector2.ZERO 
var look_vec = Vector2.ZERO 
var player = null
var speed = 3
onready var ship = get_tree().current_scene.get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	
	look_vec = ship.position - global_position


func _physics_process(delta):
	move = Vector2.ZERO 
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_AlienBullet_area_entered(area):
	if area.is_in_group("Player"):
		area.damage(1)
		queue_free()

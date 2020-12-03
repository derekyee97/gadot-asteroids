extends Area2D

export var minSpeed: float = 75
export var maxSpeed: float = 75
export var minRotationRate: float = -30
export var maxRotationRate: float = 30
onready var UI = get_tree().current_scene.get_node("UI")

var speed: float = 0
var rotationRate: float = 0
signal game_over

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	rotationRate = rand_range(minRotationRate, maxRotationRate)
	
func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	position.y += speed * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_BlackHole_area_entered(area):
	if area.is_in_group("Player"):
		get_tree().change_scene("res://Scenes/endGame.tscn")
		#queue_free()
func damage():
	pass

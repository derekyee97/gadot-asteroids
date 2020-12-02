extends Area2D

export var life: int = 20
onready var UI = get_tree().current_scene.get_node("UI")

func damage(amount: int):
	life -= amount
	if life <= 0: 
		UI.increase_score(500)
		get_parent().queue_free()

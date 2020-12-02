extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Classic_Asteroids__pressed():
	get_tree().change_scene("res://Scenes/Main Menu.tscn")
	

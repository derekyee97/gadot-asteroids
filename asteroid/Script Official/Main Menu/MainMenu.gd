extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Classic_Asteroids__pressed():
	get_tree().change_scene("res://Scenes/asteroidClassic .tscn")
	


func _on_Edited_Asteroids__pressed():
	get_tree().change_scene("res://Scenes/Variant.tscn")
	pass # Replace with function body.

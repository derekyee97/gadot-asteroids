extends Node2D

func _process(delta):
	if $AudioStreamPlayer2D.playing == false:
		$AudioStreamPlayer2D.play()


tool
extends Label

#because this can be motified at runtime
#setget is function to set the score and update the score can call instancely
export var score = 0 setget set_score 

func _ready():
	set_score(score)
	
	pass # Replace with function body.
	
#function displaye the score
func set_score(newScore):
	text = "Score: " + String(newScore) #cast to string to concat
	score =newScore
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

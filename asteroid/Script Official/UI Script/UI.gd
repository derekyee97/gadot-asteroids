extends Control

onready var scoreNode = get_node("score")
onready var HealthNode = get_node("healthBar")
onready var levelNode= get_node("level")


#increase health when clear health
func increase_health():
	HealthNode.health +=1
	pass

#decrease health when hit asteroid
func decrease_health():
	HealthNode.health -=1
	if HealthNode.health <= 0:
		get_tree().reload_current_scene()
	pass

#increase Score
func increase_score(amount):
	scoreNode.score += amount
	pass

func increase_level(level):
	levelNode.level=level
	pass

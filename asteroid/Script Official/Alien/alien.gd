extends KinematicBody2D
	
onready var BULLET_SCENE = load('res://Scenes/Alien/bullet .tscn')	
var player=null
var move=Vector2.ZERO
var speed=1

export var life: int = 10

onready var ship = get_tree().current_scene.get_node("Rocket Ship")

func _physics_process(delta):
	move=Vector2.ZERO
	
	move=position.direction_to(ship.position)*speed
	 
	move=move.normalized()
	move=move_and_collide(move)	

func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()
	
func _ready(): 
	fire()
	
func fire():
	var bullet=BULLET_SCENE.instance()
	bullet.position= get_global_position()
	get_parent().add_child(bullet)
	$Timer.set_wait_time(1)
	
	
	
func _on_Timer_timeout():
		fire()



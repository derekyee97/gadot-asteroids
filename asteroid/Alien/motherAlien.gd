extends KinematicBody2D
	
onready var BABYALIEN_SCENE = load('res://Alien/baby2.tscn')	
var player=null
var move=Vector2.ZERO
var speed=1
var forward = true

export var life: int = 10

onready var ship = get_tree().current_scene.get_node("Player")

func _physics_process(delta):
	if forward and position.x < 1000 :
		position.x += 1
		if position.x >= 1000:
			forward=false
	else: 
		position.x -= 1
		if position.x <= 0: 
			forward=true
	pass

func _ready(): 
	fire()
	
func fire():
	var bullet=BABYALIEN_SCENE.instance()
	bullet.position= get_global_position()
	get_parent().add_child(bullet)
	$Timer.set_wait_time(10)
	
func _on_Timer_timeout():
		fire()



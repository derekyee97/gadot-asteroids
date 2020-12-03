extends KinematicBody2D

onready var BULLET_SCENE = preload('res://Alien/AlienBullet.tscn')	
var player=null
var move=Vector2.ZERO
var speed=1
onready var ship = get_tree().current_scene.get_node("Player")



func _physics_process(delta):
	move=Vector2.ZERO
	
	move=position.direction_to(ship.position)*speed
	 
	move=move.normalized()
	move=move_and_collide(move)	
	

func fire():
	var bullet=BULLET_SCENE.instance()
	bullet.position= get_global_position()
	bullet.player = player
	get_parent().add_child(bullet)
	$Timer.set_wait_time(3)
	

func _on_Timer_timeout():
	fire()
	

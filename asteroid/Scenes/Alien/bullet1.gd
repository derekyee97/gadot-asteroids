extends Node2D

var move = Vector2.ZERO 
var look_vec = Vector2.ZERO 
var player = null
onready var ship = get_tree().current_scene.get_node("Rocket Ship")

#signal explode

var speed = 3 

# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("explode",self,"_hitShip") #when explode sugnal received, call _explode
	look_vec = ship.position-global_position

#func _hitShip():
	
#	pass	
	
func _physics_process(delta):
	move = Vector2.ZERO 
	move = move.move_toward(look_vec, delta)
	move = move.normalized() * speed
	position += move


extends "res://Script Official/Weightless/Weightless.gd"

var Missile = preload("res://Scenes/Missile/Missile.tscn") #loads scene we created so can use

export(float) var engine_forward= 200
export(float) var engine_rotate= 2000
export(float) var missile_speed= 300
export(float) var missile_timeLimit= 0.2

var forward=Vector2() #curr forward 
var rotate_dir= 0 #curr rotate 
var missile_recharge=0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _process(delta):
	if Input.is_action_pressed("ui_up"):
		forward=Vector2(engine_forward,0)  #x and y direction  forward direction
	else:
		forward=Vector2()
	if Input.is_action_pressed("ui_left"):
		rotate_dir=-1 #counter clockwise
	elif Input.is_action_pressed("ui_right"):
		rotate_dir=1 # clockwise
	else: 
		rotate_dir=0
		
	if Input.is_action_pressed("ui_accept"):
		if missile_recharge <= 0:
			for offset in [Vector2(15, -45 / 2),Vector2(15,45 / 2)]: #15 to the right
				var missile=Missile.instance() #new instance of scene , need to show in view
				missile.position=position + offset.rotated(rotation) #set missile to own position
				missile.rotation=rotation
				missile.linear_velocity=linear_velocity + Vector2(missile_speed,0).rotated(rotation) #missile go zoom faster
				get_parent().add_child(missile) #add to own parent so move independent, add location of missile scene
				missile_recharge=missile_timeLimit
		else:
			missile_recharge -= delta
		
		
		
		
		
	pass

func _integrate_forces(state):
	set_applied_force(forward.rotated(rotation))
	set_applied_torque(rotate_dir * engine_rotate) #spin based on engine rotate 
	._integrate_forces(state) #for inheritence, so do above things first, then do parent stuff
	pass

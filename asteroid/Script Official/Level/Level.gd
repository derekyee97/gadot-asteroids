extends Node2D

var asteroidSmall = load("res://Scenes/Asteroid Scene/AsteroidSmall .tscn")
var asteroidMedium = load("res://Scenes/Asteroid Scene/AsteroidMedium.tscn")
var asteroidLarge = load("res://Scenes/Asteroid Scene/AsteroidLarge.tscn")

onready var ship = get_tree().current_scene.get_node("Rocket Ship")
onready var UI = get_tree().current_scene.get_node("UI")

export var level = 0
export var SafeDistance = 200
export var asteroidPerLevel = 2
export var asteroidMaxSpeed = 200
export var asteroidMinSpeed = 100

func _process(delta):
	if get_child_count() == 0:
		level +=1
		UI.increase_level(level)
		var avoidRadius = ship.position
		var viewPort = get_viewport().get_visible_rect().size 	#create randome interger to load random asteroid
		
		UI.increase_health()
		
		for i in range (level * asteroidPerLevel):
			var child

			match randi() % 3: 
				0 : child = asteroidSmall.instance()
				1 : child = asteroidMedium.instance()
				2 : child = asteroidLarge.instance()
				
			var asteroidPosition = avoidRadius
			while (asteroidPosition - avoidRadius).length() <= SafeDistance :
				asteroidPosition.x = rand_range(0, viewPort.x)
				asteroidPosition.y = rand_range(0, viewPort.y)
				pass
			child.position = asteroidPosition
			
			var randnum 
			if rand_range(0,10) < 5:
				randnum = 0
			else:
				randnum = 1
				
			var angle = randnum * PI * 2
			var speed = rand_range(asteroidMinSpeed, asteroidMaxSpeed)
			child.linear_velocity = Vector2(speed, 0).rotated(angle)
			add_child(child)
			pass
		pass
	pass # Replace with function body.

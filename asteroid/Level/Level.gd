extends Node2D

var plMeteor := preload("res://Meteor/Meteor.tscn")
var plAlien := preload("res://Alien/Alien.tscn")
onready var UI = get_tree().current_scene.get_node("UI")
var meteorCount = 0
var alienCount = 0
var numObject = 1
var level = 0

func _process(delta):
	if get_child_count() == 0:
		var child
		level+=1
		print(level)
		UI.increase_level(level)
		
		if level == 1 || level == 2:
			child = plMeteor.instance()
			var prep = Vector2()
			var newPrep = Vector2(prep.x + randi()%1000,0)
			child.set_position(newPrep)
			add_child(child) 
				
		elif level == 3 || level == 4 :
			child = plAlien.instance()
			var prep = Vector2()
			var newPrep = Vector2(prep.x + randi()%1000,0)
			child.set_position(newPrep)
			add_child(child)
			
		else :	
			var viewPort = get_viewport().get_visible_rect().size 	#create randome interger to load random asteroid
			
			for i in range (3):
				randomize()
				match randi() % 2: 
					0 : child = plMeteor.instance()
					1 : child = plAlien.instance()
					
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
			
				add_child(child)
	

	

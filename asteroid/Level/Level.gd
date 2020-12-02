extends Node2D

var plMeteor := preload("res://Meteor/Meteor.tscn")
var plAlien := preload("res://Alien/Alien.tscn")
var meteorCount = 0
var alienCount = 0
var numObject = 2
func _process(delta):
	
	
	if get_child_count() <= numObject:
		var viewPort = get_viewport().get_visible_rect().size 	#create randome interger to load random asteroid
		
		for i in range (3 ):
			var child
			randomize()
			match randi() % 2: 
				0 : child = plMeteor.instance()
				1 : child = plAlien.instance()
				
			var prep = Vector2()
			var newPrep = Vector2(prep.x + randi()%1000,0)
			child.set_position(newPrep)
		
			add_child(child)
	

	

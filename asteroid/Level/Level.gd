extends Node2D

var plMeteor := preload("res://Meteor/Meteor.tscn")
var plsmallMeteor := preload("res://Meteor/SmallMeteor.tscn")
var plFastMeteor := preload("res://Meteor/fastMeteor.tscn")
var plAlien := preload("res://Alien/Alien.tscn")
var Blackhole := preload("res://BlackHole/BlackHole.tscn")
var plMotherAlien := preload("res://Alien/motherAlien.tscn")
var extraLife := preload("res://Player/extraLife.tscn")

onready var UI = get_tree().current_scene.get_node("UI")

var meteorCount = 0
var alienCount = 0
var numObject = 1
var level = 0
var spawnObjects = 3
func _process(delta):
	if get_child_count() < 2:
		if level%5 == 0: 
			spawnObjects += 1
		
		var child
		level+=1
		print(level)
		UI.increase_level(level)
		
		if level == 1:
			for i in range (3):
				randomize()
				child=plMeteor.instance()	
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
				add_child(child)
			
		elif level == 2:
			for i in range (2):
				randomize()
				child=plAlien.instance()					
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
				add_child(child)
			
		elif level == 3:
			for i in range (2):
				randomize()
				child=plMotherAlien.instance()					
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
				add_child(child)
		
		elif level == 4:
			for i in range (2):
				randomize()
				child=Blackhole.instance()					
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
				add_child(child)
		
		elif level == 5:
			for i in range (2):
				randomize()
				child=extraLife.instance()					
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
				add_child(child)
		
		else :	
			var viewPort = get_viewport().get_visible_rect().size 	#create randome interger to load random asteroid
			
			for i in range (spawnObjects):
				randomize()
				match randi() % 7: 
					0 : child = plMeteor.instance()
					1 : child = plsmallMeteor.instance()
					2 : child = plFastMeteor.instance()
					3 : child = Blackhole.instance()
					4 : child = plMotherAlien.instance()
					5 : child = plAlien.instance()
					6 : child = extraLife.instance()					
					
				var prep = Vector2()
				var newPrep = Vector2(prep.x + randi()%1000,0)
				child.set_position(newPrep)
			
				add_child(child)
	

	

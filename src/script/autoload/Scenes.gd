extends Node
# CONTAINS ALL SCENES

var shop_scene = preload("res://src/scenes/shop/Shop.tscn")

func add(Scene, parent):
	var object = Scene.instance()
	Methods.add(parent,object)

func add_shop(parent): 
	add(shop_scene,parent)
#	get_tree().paused = true

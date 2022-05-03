extends Node
# CONTAINS ALL SCENES

var shop_scene = preload("res://src/scenes/shop/Shop.tscn")
var player_scene = preload("res://src/scenes/ACTORS/Player/Player.tscn")

func add(Scene, parent,pos = null):
	var object = Scene.instance()
	if pos:
		object.position = pos
	
	
	Methods.add(parent,object)

func add_shop(parent): add(shop_scene,parent)

func add_player(parent,pos): 
	add(player_scene,parent,pos)

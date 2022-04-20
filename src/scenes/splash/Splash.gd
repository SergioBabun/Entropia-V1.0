extends Control


func _ready():
	pass

func next_scene():
	var scene = preload("res://src/scenes/mainscene/Mundo.tscn")
	var object = scene.instance()
	get_parent().add_child(object)
	Methods.delete(self)

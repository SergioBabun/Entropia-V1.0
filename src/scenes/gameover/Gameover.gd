extends Control


func _ready():
	pass


func _on_Timer_timeout():
	next_scene()
	Methods.delete(get_parent().get_parent())
	pass # Replace with function body.

func next_scene():
	var next_scene = load("res://src/scenes/mainscene/Mundo.tscn")
	var object = next_scene.instance()
	get_parent().get_parent().get_parent().add_child(object)


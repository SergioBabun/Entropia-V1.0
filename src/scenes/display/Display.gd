extends Control


func _ready():
	pass


func _on_Button_pressed():
	next_scene()
	pass # Replace with function body.

func next_scene():
	var next_scene = load("res://src/scenes/mainscene/Mundo.tscn")
	var object = next_scene.instance()
	Methods.delete(get_parent().get_parent())
	get_parent().get_parent().get_parent().add_child(object)

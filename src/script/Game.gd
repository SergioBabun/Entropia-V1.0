extends Control

export var splash_on = true #it plays the intro company scene

func _ready():
	if splash_on: next_scene("res://src/scenes/splash/Splash.tscn")
	else: next_scene("res://src/scenes/mainscene/Mundo.tscn")

func next_scene(scene):
	var next_scene = load(scene)
	var object = next_scene.instance()
	add_child(object)


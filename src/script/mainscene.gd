extends Control


func _ready():
	Global.connect("player_dead",self,'gameover')


func gameover():
	var gameover_scene = preload("res://src/scenes/gameover/Gameover.tscn")
	var gameover = gameover_scene.instance()
	get_node("CanvasLayer").add_child(gameover)
	
	pass

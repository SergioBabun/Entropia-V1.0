extends Node2D

var monedas :int = 0

func _ready():
	Global.connect("player_dead",self,'gameover')


func gameover():
	var gameover_scene = preload("res://gameover/Gameover.tscn")
	var gameover = gameover_scene.instance()
	get_node("Camera2D").add_child(gameover)
	
	pass

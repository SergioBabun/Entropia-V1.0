extends Control


func _ready():
	Global.last_pos = $Position2D.global_position
	Global.connect("player_dead",self,'gameover')
	Methods.connect("player_enter",self,'add_player')
	Methods.emit_signal("player_enter")

		
func gameover():
	Global.battery -= 1
	var gameover_scene = preload("res://src/scenes/gameover/Gameover.tscn")
	var gameover = gameover_scene.instance()
	get_node("CanvasLayer").add_child(gameover)
	
	pass

func add_player():
	Scenes.add_player(self,Global.last_pos)
	pass

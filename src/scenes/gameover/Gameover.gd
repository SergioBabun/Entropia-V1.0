extends Control


func _ready():
	gameover()
	pass


func _on_Timer_timeout():
	next_scene()
	hide()
	pass # Replace with function body.

func gameover():
	if Global.battery > 0:
		reduce_battery()
	else:
		$Label.show()
		$CenterContainer.hide()
		$Timer.start()
	
	pass

func reduce_battery():
	$Label.hide()
	for i in Global.max_battery - 1:
		var newheart = $CenterContainer/HBoxContainer/TextureRect.duplicate()
		$CenterContainer/HBoxContainer.add_child(newheart)
		if i + 2 > Global.battery:
			newheart.get_node("AnimationPlayer").play("New Anim")
	yield(get_tree().create_timer(1),'timeout')
	queue_free()
	Methods.emit_signal("player_enter")
	pass

func next_scene():
	var next_scene = load("res://src/scenes/display/Display.tscn")
	var object = next_scene.instance()
	get_parent().add_child(object)



extends Control

var can_exit = false
func _ready():
	get_tree().paused = true
	yield(get_tree().create_timer(0.5),"timeout")
	can_exit = true
	pass

func _process(delta):
	if Input.is_action_just_pressed("shop") and can_exit:
		exit()

func exit():
	Methods.delete(self)
	get_tree().paused = false
	pass

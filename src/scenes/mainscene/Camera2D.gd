extends Camera2D


func _ready():
	pass

func _process(delta):
	
	if get_parent().has_node('Player'):
		global_position = get_parent().get_node('Player').global_position

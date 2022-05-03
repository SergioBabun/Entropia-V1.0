extends CanvasLayer


func _ready():
	Methods.connect("player_enter",self,'set_max_value')

func set_max_value():
	$TextureProgress.max_value = Global.health
	$TextureProgress.value = Global.health
	pass


func _process(_delta):
	if get_parent().has_node("Player"):
		$TextureProgress.value = get_parent().get_node('Player').health
	else:
		$TextureProgress.value = 0

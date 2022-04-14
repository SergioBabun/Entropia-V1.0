extends CanvasLayer

export(NodePath) var jugadorscript_node
onready var jugadorscript = get_node(jugadorscript_node)

func _ready():
	$TextureProgress.max_value = jugadorscript.health

func _process(_delta):
	if get_parent().has_node("Player"):
		$TextureProgress.value = jugadorscript.health
	else:
		$TextureProgress.value = 0

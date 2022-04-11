extends CanvasLayer

export(NodePath) var jugadorscript_node
onready var jugadorscript = get_node(jugadorscript_node)

func _ready():
	$TextureProgress.max_value = jugadorscript.health

func _process(_delta):
	$TextureProgress.value = jugadorscript.health

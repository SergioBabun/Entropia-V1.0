extends CanvasLayer

func _process(_delta):
	$Label.text = str(get_parent().monedas)
	$Label2.text = str(Global.fires)

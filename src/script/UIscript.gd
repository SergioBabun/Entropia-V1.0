extends CanvasLayer

func _process(_delta):
	$Label.text = str(Global.coins)
	$Label2.text = str(Global.fires)

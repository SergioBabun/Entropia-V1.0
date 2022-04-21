extends Button

var item_name = ''
var item_price = ''
var item_texture

func _ready():
	$TextureRect.texture = item_texture
	grab_focus()
	pass

func _on_Panel_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		Shop.emit_signal("item",{'name': item_name, 'price': item_price})
	pass # Replace with function body.


func _on_Item_pressed():
	Shop.emit_signal("item",{'name': item_name, 'price': item_price})
	pass # Replace with function body.

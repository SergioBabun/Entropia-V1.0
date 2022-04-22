extends Button

var item_name = ''
var item_price = ''
var item_texture
var item_amount = 0

func _ready():
	print(Global.Inventory)
	print(item_texture)
	$TextureRect.texture = load(item_texture)
	$Label.text = str(item_amount)
	grab_focus()
	if item_amount > 1: $Label.show()
	else: $Label.hide()
	pass


func _on_Item_pressed():
	Shop.emit_signal("item",{'name': item_name, 'price': item_price, 'texture': item_texture, 'amount': item_amount})
	pass # Replace with function body.

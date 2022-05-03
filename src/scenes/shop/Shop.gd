extends Control

#SHOP

var can_exit = false
var spinvalue = 1

#INVENTROY TAB
onready var inventory_item_holder = $container/TabContainer/Inventory/body/ScrollContainer/Items
onready var inventory_coin_label = $container/TabContainer/Inventory/body/coin/Label2
onready var inventory_shop_label = $container/TabContainer/Inventory/body/text/RichTextLabel
onready var inventory_buy_label = $container/TabContainer/Inventory/body/HBoxContainer2/Label
onready var inventory_spin = $container/TabContainer/Inventory/body/HBoxContainer2/SpinBox

#WEAPON TAB
onready var weapon_item_holder = $container/TabContainer/Weapons/body/ScrollContainer/Items
onready var weapon_coin_label = $container/TabContainer/Weapons/body/coin/Label2
onready var weapon_shop_label = $container/TabContainer/Weapons/body/text/RichTextLabel
onready var weapon_buy_label = $container/TabContainer/Weapons/body/HBoxContainer2/Label
onready var weapon_spin = $container/TabContainer/Weapons/body/HBoxContainer2/SpinBox

#SKIN TAB
onready var skin_item_holder = $container/TabContainer/Skins/body/ScrollContainer/Items
onready var skin_coin_label = $container/TabContainer/Skins/body/coin/Label2
onready var skin_shop_label = $container/TabContainer/Skins/body/text/RichTextLabel
onready var skin_buy_label = $container/TabContainer/Skins/body/HBoxContainer2/Label
onready var skin_spin = $container/TabContainer/Skins/body/HBoxContainer2/SpinBox

#MATERIALS TAB
onready var material_item_holder = $container/TabContainer/Materials/body/ScrollContainer/Items
onready var material_coin_label = $container/TabContainer/Materials/body/coin/Label2
onready var material_shop_label = $container/TabContainer/Materials/body/text/RichTextLabel
onready var material_buy_label = $container/TabContainer/Materials/body/HBoxContainer2/Label
onready var material_spin = $container/TabContainer/Materials/body/HBoxContainer2/SpinBox

func _ready():
	Shop.connect("item",self,'set_text')
	default()
	pass

func _process(delta):
	if Input.is_action_just_pressed("shop") and can_exit:
		exit()

func default():
	fillShop()
	setCoinText()
	get_tree().paused = true
	yield(get_tree().create_timer(0.5),"timeout")
	can_exit = true

func fillShop():
	# TO REMOVE DUPLICATE AND UPDATE LIST
	for i in inventory_item_holder.get_children():
		i.queue_free()
	for i in weapon_item_holder.get_children():
		i.queue_free()
	for i in skin_item_holder.get_children():
		i.queue_free()
	for i in material_item_holder.get_children():
		i.queue_free()
	
	# TO FILL LIST
	for i in Shop.weapons: 
		spawnItem(i,weapon_item_holder)

	for i in Shop.skins: 
		spawnItem(i,skin_item_holder)

	for i in Shop.materials: 
		spawnItem(i,material_item_holder)
	
	
	for i in Global.Inventory: 
		spawnItem(i,inventory_item_holder)
	pass

func spawnItem(i,holder):
	var item_scene = preload("res://src/scenes/shop/Panel.tscn")
	var item = item_scene.instance()
	item.item_name = i.name
	item.item_price = i.price
	item.item_texture = i.texture
	item.item_amount = i.amount
	holder.add_child(item)

func set_text(res):
	var itemToBuy = res
	weapon_buy_label.text = 'Buy Item: ' + str(itemToBuy.name) + ' | ' + 'Price: ' + str(itemToBuy.price * spinvalue) + ' coins'
	skin_buy_label.text = 'Buy Item: ' + str(itemToBuy.name) + ' | ' + 'Price: ' + str(itemToBuy.price * spinvalue) + ' coins'
	material_buy_label.text = 'Buy Item: ' + str(itemToBuy.name) + ' | ' + 'Price: ' + str(itemToBuy.price * spinvalue) + ' coins'
	inventory_buy_label.text = 'Use Item: ' + str(itemToBuy.name) + '(' + str(itemToBuy.amount) + ')'
	pass

func setCoinText():
	weapon_coin_label.text = 'Available Coins: ' + str(Global.coins) + ' Coins'
	skin_coin_label.text = 'Available Coins: ' + str(Global.coins) + ' Coins'
	material_coin_label.text = 'Available Coins: ' + str(Global.coins) + ' Coins'
	inventory_coin_label.text = 'Available Coins: ' + str(Global.coins) + ' Coins'
	pass

func buyItem():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("shop_anim")
	if Shop.item_selected:
		if Global.coins < Shop.item_selected.price * spinvalue:
			weapon_shop_label.bbcode_text = '[center] > Coins are not enough <'
			skin_shop_label.bbcode_text = '[center] > Coins are not enough <'
			material_shop_label.bbcode_text = '[center] > Coins are not enough <'
		else:
			weapon_shop_label.bbcode_text = '[center] > Thanks for purchasing ' + str(Shop.item_selected.name) + ' <'
			skin_shop_label.bbcode_text = '[center] > Thanks for purchasing ' + str(Shop.item_selected.name) + ' <'
			material_shop_label.bbcode_text = '[center] > Thanks for purchasing ' + str(Shop.item_selected.name) + ' <'
			buy()
	else:
		weapon_shop_label.bbcode_text = '[center] > No Item Selected <'
		skin_shop_label.bbcode_text = '[center] > No Item Selected <'
		material_shop_label.bbcode_text = '[center] > No Item Selected <'
		
	pass

func useItem():
	$AnimationPlayer.stop()
	$AnimationPlayer.play("shop_anim")
	if Shop.item_selected:
		if Shop.item_selected.amount < spinvalue:
			inventory_shop_label.bbcode_text = '[center] > Items are not enough <'
		else:
			inventory_shop_label.bbcode_text = '[center] > ' + str(Shop.item_selected.name) + ' is Used! <'
			use()
	else:
		inventory_shop_label.bbcode_text = '[center] > No Item Selected <'
		
	pass

func use():
	Shop.item_selected.amount -= spinvalue
	if Shop.item_selected.name == 'Battery':
		Global.battery = clamp(Global.battery + spinvalue, 0, Global.max_battery)
		print(Global.battery)
	if Shop.item_selected.amount > 0:
		Methods.compareInventory(Shop.item_selected)
		fillShop()
		Shop.item_selected = null
	else:
		Methods.removeInventory(Shop.item_selected)
		fillShop()
		Shop.item_selected = null
	Global.saveData()
	pass

func buy():
	Global.coins -= Shop.item_selected.price * spinvalue
	Shop.item_selected.amount = spinvalue
	setCoinText()
	Methods.addInventory(Shop.item_selected)
	Shop.item_selected = null
	Global.saveData()
	pass

func exit():
	Methods.delete(get_parent())
	get_tree().paused = false
	pass

func _on_Button_pressed():
	buyItem()
	pass # Replace with function body.


func _on_TabContainer_tab_changed(tab):
	Shop.item_selected = null
	spinvalue = 1
	weapon_spin.value = 1
	skin_spin.value = 1
	material_spin.value = 1
	set_text({'name': 'Item', 'price': 0, 'amount': 0})
	fillShop()
	pass # Replace with function body.


func _on_SpinBox_value_changed(value):
	spinvalue = value
	if Shop.item_selected:
		set_text(Shop.item_selected)
	pass # Replace with function body.


func _on_UseButton_pressed():
	useItem()
	pass # Replace with function body.

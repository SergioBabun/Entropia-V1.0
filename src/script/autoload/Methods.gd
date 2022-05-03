extends Node
#CONTAINS ALL METHODS

signal player_enter

func delete(object):
	object.call_deferred('queue_free')

func add(object, child):
	object.call_deferred('add_child',child)

func addInventory(object):
	for i in Global.Inventory:
		if i.name == object.name:
			i.amount += object.amount
			return
	Global.Inventory.append(object)

func removeInventory(object):
	for i in Global.Inventory.size():
		if Global.Inventory[i].name == object.name:
			Global.Inventory.remove(i)
			return

func compareInventory(object):
	for i in Global.Inventory:
		if i.name == object.name:
			i.amount = object.amount
			return
	

extends Node

signal item(body)
var item_selected = {}
var weapons = [
	{ 
		'name': 'Small Axe',
		'price': 10,
		'texture': load("res://src/ASSETS/axe/W_Axe001.png"),
	},
	{ 
		'name': 'Little Axe',
		'price': 20,
		'texture': load("res://src/ASSETS/axe/W_Axe002.png"),
	},
	{ 
		'name': 'Iron Axe',
		'price': 100,
		'texture': load("res://src/ASSETS/axe/W_Axe007.png"),
	},
	{ 
		'name': 'Demon Axe',
		'price': 2000,
		'texture': load("res://src/ASSETS/axe/W_Axe011.png"),
	},
]

var skins = [
	{ 
		'name': 'Iron Axe',
		'price': 100,
		'texture': load("res://src/ASSETS/axe/W_Axe007.png"),
	},
	{ 
		'name': 'Demon Axe',
		'price': 2000,
		'texture': load("res://src/ASSETS/axe/W_Axe011.png"),
	},
]

var materials = [
	{ 
		'name': 'Small Axe',
		'price': 10,
		'texture': load("res://src/ASSETS/axe/W_Axe001.png"),
	},
	{ 
		'name': 'Demon Axe',
		'price': 2000,
		'texture': load("res://src/ASSETS/axe/W_Axe011.png"),
	},
]

func _ready():
	connect("item",self,'setItem')
	pass

func setItem(item):
	item_selected = item
	pass

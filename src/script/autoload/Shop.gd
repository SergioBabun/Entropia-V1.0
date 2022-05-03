extends Node

signal item(body)
var item_selected = {}
var weapons = [
	{ 
		'name': 'Small Axe',
		'price': 10,
		'texture': "res://src/ASSETS/axe/W_Axe001.png",
		'amount': 1,
	},
	{ 
		'name': 'Little Axe',
		'price': 20,
		'texture': "res://src/ASSETS/axe/W_Axe002.png",
		'amount': 1,
	},
	{ 
		'name': 'Iron Axe',
		'price': 100,
		'texture': "res://src/ASSETS/axe/W_Axe007.png",
		'amount': 1,
	},
	{ 
		'name': 'Demon Axe',
		'price': 2000,
		'texture': "res://src/ASSETS/axe/W_Axe011.png",
		'amount': 1,
	},
]

var skins = [
	{ 
		'name': 'Iron Axe',
		'price': 100,
		'texture': "res://src/ASSETS/axe/W_Axe007.png",
		'amount': 1,
	},
	{ 
		'name': 'Demon Axe',
		'price': 2000,
		'texture': "res://src/ASSETS/axe/W_Axe011.png",
		'amount': 1,
	},
]

var materials = [
	{ 
		'name': 'Small Axe',
		'price': 10,
		'texture': "res://src/ASSETS/axe/W_Axe001.png",
		'amount': 1,
	},
	{ 
		'name': 'Demon Axe',
		'price': 2000,
		'texture': "res://src/ASSETS/axe/W_Axe011.png",
		'amount': 1,
	},
	{ 
		'name': 'Battery',
		'price': 0,
		'texture': "res://src/ASSETS/battery/S_Holy01.png" ,
		'amount': 1,
	},
]

func _ready():
	connect("item",self,'setItem')
	pass

func setItem(item):
	item_selected = item
	pass

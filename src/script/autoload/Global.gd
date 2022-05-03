extends Node

signal player_dead

var health = 10
var battery = 3
var max_battery = 3
var coins = 30
var fires = 0
var fireSpritSpawned = false

var last_pos = Vector2.ZERO

var Inventory = []

var save_data = {
	"inventory" : [],
	"coins": 0,
	}
var path_to_data_file = "user://colorwheels_save_file.json"
var instance_data_file = File.new()

func _ready():
	loadData()
#	saveData()
	pass

func loadData():
	if not instance_data_file.file_exists(path_to_data_file):
		return
	instance_data_file.open(path_to_data_file,File.READ)
	save_data = parse_json(instance_data_file.get_as_text())
	coins = save_data["coins"]
	Inventory = save_data["inventory"]
	#in the main scene ready function the highscore label = main_text

func saveData():
	save_data["coins"] = coins
	save_data["inventory"] = Inventory
	instance_data_file.open(path_to_data_file,File.WRITE)
	instance_data_file.store_line(to_json(save_data))
	instance_data_file.close()

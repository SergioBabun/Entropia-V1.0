extends Area2D


func _ready():
	pass


func _on_fireSpiritPickUp_body_entered(body):
	Global.fires += 1
	if Global.fireSpritSpawned != true:
		body.spawn_fire_spirit()
		Global.fireSpritSpawned = true
	Methods.delete(self)
	pass # Replace with function body.

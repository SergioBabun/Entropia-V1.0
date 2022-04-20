extends KinematicBody2D

var player = null
var speed = 0.05
var offset = 50
var max_offset = 50
var fireball_speed = 300


func _ready():
	$AnimationTree.active = true
	pass

func _process(delta):
	if player:
		global_position = lerp(global_position,player.global_position + Vector2(offset,0), speed)

func _fireball(dir):
	if Global.fires > 0:
		Global.fires -= 1
	else:
		return
	var fireball_scene = preload("res://src/scenes/ACTORS/FireSpirit/fireball.tscn")
	var fireball = fireball_scene.instance()
	fireball.global_position = global_position + Vector2(30 * dir,5)
	fireball.linear_velocity.x = dir * fireball_speed
	if dir == -1: fireball.get_node("Sprite").flip_v = true
	get_parent().add_child(fireball)
	
	
	pass

func change_dir(dir):
	if dir == -1:
		offset = max_offset
		$Sprite.flip_h = true
	else:
		offset = -max_offset
		$Sprite.flip_h = false
	pass

func remove_player():
	player = null

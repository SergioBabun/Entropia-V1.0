extends KinematicBody2D

var health = 10
const ACCELERATION = 70
const MAX_SPEED = 300
const JUMP_H = -600
const UP = Vector2(0, -1)
const gravity = 30
var motion = Vector2.ZERO
var dir = -1
onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
 

signal fire_shoot(dir) #TELLS THE FIRESPIRIT TO FIRE
signal move(dir) #TELLS THE FIRESPIRIT WHAT DIRECTION HE IS FACING

func _ready():
	pass

func _physics_process(_delta):
	# apply gravity to the player
	motion.y += gravity
	var friction = false
 
	if Input.is_action_pressed("ui_right"):
		dir = 1
		emit_signal("move",dir)
		sprite.flip_h = true
		animationPlayer.play("Walk")
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
	elif Input.is_action_pressed("ui_left"):
		dir = -1
		emit_signal("move",dir)
		animationPlayer.play("Walk")
		sprite.flip_h = false
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
	else:
		animationPlayer.play("Idle")
		friction = true
 
	if is_on_floor():
 
		if Input.is_action_just_pressed("ui_accept"):
			motion.y = JUMP_H
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.01)
 
	motion = move_and_slide(motion, UP)


func take_damage(value):
	health -= value
	if health <= value:
		Methods.delete(self)
		Global.emit_signal("player_dead")

func spawn_fire_spirit():
	yield(get_tree().create_timer(0.1),"timeout")
	var fire_spirit_scene = preload("res://src/scenes/ACTORS/FireSpirit/fireSpirit.tscn")
	var fire_spirit = fire_spirit_scene.instance()
	fire_spirit.player = self
	connect("fire_shoot",fire_spirit,'_fireball')
	connect("move",fire_spirit,'change_dir')
	Global.connect("player_dead",fire_spirit,'remove_player')
	fire_spirit.global_position = global_position
	get_parent().add_child(fire_spirit)

func _input(event):
	if Input.is_action_just_pressed("shoot"):
		emit_signal("fire_shoot",dir)
		pass
	
	if Input.is_key_pressed(KEY_ESCAPE):
		Scenes.add_shop(get_parent().get_node('CanvasLayer'))
	pass

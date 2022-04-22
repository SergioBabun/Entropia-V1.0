extends KinematicBody2D

export (int) var damage = 1

onready var hitbox = $Hitbox
var health = 5

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()

# CAlled when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.scale.x = -1
	motion.x = MAX_SPEED
	pass # Replace with function body


func _next_to_left_wall() -> bool:
	if $LeftRay.is_colliding(): return true
	if $LeftRay2.is_colliding(): return true
	
	return false

func _next_to_right_wall() -> bool:
	if $Rightleft.is_colliding(): return true
	if $Rightleft2.is_colliding(): return true
	
	return false

func _floor_detection() -> bool:
	return $AnimatedSprite/Floordetection.is_colliding()

func _flip():
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		motion.x = -motion.x
		$AnimatedSprite.scale.x *= -1

# warning-ignore:unused_argument
func _process(delta):
	motion.y += GRAVITY
	_flip()

	motion = move_and_slide(motion)
	pass


func _on_Hurtbox_body_entered(body):
	if body.is_in_group('player'): 
		if body.has_method('take_damage'): body.take_damage(damage)
	pass # Replace with function body.

func take_damage(value):
	health -= value
	if health <= value:
		Methods.delete(self)

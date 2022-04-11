extends KinematicBody2D

export (int) var damage = 20

onready var hitbox = $Hitbox

const MAX_SPEED : float = 100.0
const GRAVITY : float = 25.0

var motion := Vector2()

# CAlled when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.scale.x = -1
	motion.x = MAX_SPEED
	pass # Replace with function body


func _next_to_left_wall() -> bool:
	return $LeftRay.is_colliding()

func _next_to_right_wall() -> bool:
	return $Rightleft.is_colliding()

func _floor_detection() -> bool:
	return $AnimatedSprite/Floordetection.is_colliding()

func _flip():
	if _next_to_right_wall() or _next_to_left_wall() or !_floor_detection():
		motion.x *= -1
		$AnimatedSprite.scale.x *= -1

# warning-ignore:unused_argument
func _process(delta):
	motion.y += GRAVITY
	_flip()

	motion = move_and_slide(motion)
	pass

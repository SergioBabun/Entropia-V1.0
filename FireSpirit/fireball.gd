extends RigidBody2D
var damage = 2
func _ready():
	pass


func _on_fireball_body_entered(body):
	if body.has_method('take_damage'):
		body.take_damage(damage)
	$death.play("fade")
	pass # Replace with function body.

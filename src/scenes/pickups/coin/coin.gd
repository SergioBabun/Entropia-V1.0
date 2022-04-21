extends Node2D


func _on_Area2D_body_entered(body):
	if body.is_in_group("kinematicbody2d"):
		
		Global.coins += 1
		Methods.delete(self)
	pass # Replace with function body.

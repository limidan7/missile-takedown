class_name detection extends Area2D


	
		


func _on_body_entered(body: Node2D) -> void:
	if body == Enemy:
		if body.is_tank_zombie:
			Autoload.player_health -= 2
		else:
			Autoload.player_health -= 1

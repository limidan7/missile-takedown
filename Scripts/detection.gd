extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area is Enemy_area:
		Autoload.player_health -= 1
		

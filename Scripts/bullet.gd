class_name Bullet extends Node2D
var movement_enabled : bool = true
var bullet_movespeed = -200
var enemydied = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = 596
	$Area2D/Sprite2D.play("idle")
	$Area2D.monitoring = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if movement_enabled == true:
		position.y += bullet_movespeed*delta
		
	bullet_increase()









func bullet_increase():
	while Autoload.bullet_count < 5:
		$AmmoTimer.start()
		await $AmmoTimer.timeout 
		Autoload.bullet_count += 1


func _on_area_2d_body_entered(body: Node2D) -> void:
		if body is Enemy:
			movement_enabled = false
			$Area2D.set_deferred("monitoring", false)
			enemydied = false # checks if the body is an enemy i.e Zombie
			
			# checks the zombie type and reacts accordingly
			if body.is_tank_zombie == true:
				body.tank_zombie_health -= 1
				enemydied = true
				if body.tank_zombie_health == 0:
					Autoload.Score += 1
					body.queue_free()
					enemydied = true
			elif body.is_ammo_zombie == true:
					Autoload.bullet_count += 5
					Autoload.Score += 1
					body.queue_free()
					enemydied=true
			else:
				Autoload.Score += 1
				body.queue_free()
				enemydied=true
				
		if enemydied:#after zombie type has been clarified and killed destroy bullet and reset
			$Area2D/Sprite2D.play("Explode")
			await $Area2D/Sprite2D.animation_finished
			movement_enabled = true
			print(Autoload.Score)
			queue_free()

class_name Bullet extends Node2D
var movement_enabled : bool = true
var bullet_movespeed = -200
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




func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Enemy_area:
		movement_enabled = false
		$Area2D.monitoring = false
		area.queue_free()
		Autoload.Score += 0
		$Area2D/Sprite2D.play("Explode")
		await $Area2D/Sprite2D.animation_finished
		movement_enabled = true
		print(Autoload.Score)
		queue_free()

func bullet_increase():
	while Autoload.bullet_count < 5:
		$AmmoTimer.start()
		await $AmmoTimer.timeout 
		Autoload.bullet_count += 1

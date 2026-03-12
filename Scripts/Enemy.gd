class_name Enemy extends CharacterBody2D
const movespeed = 100
var tank_zombie_health:int = 2
var rand_num = randi_range(0,2)
var is_ammo_zombie : bool = false
var is_tank_zombie: bool = false
var can_move:bool = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Autoload.game_over.connect(game_over_movement)
	
	$Sprite.play("Walk")
	
	position.y = -20
	if rand_num == 0: 
		position.x = 60
	elif rand_num == 1:
		position.x = 180
	else:
		position.x = 300
		
	var zombie_select = randi_range(1,100)
	if zombie_select > 80:
		$Sprite.play("walk")
		$Sprite.modulate.a =0.5
		is_ammo_zombie = true
	elif zombie_select > 70 and zombie_select < 80:
		$Sprite.scale *= 1.5
		$Sprite.play("walk")
		is_tank_zombie = true
	else:
		is_ammo_zombie = false
		is_tank_zombie = false
		$Sprite.modulate.a = 1
		print(zombie_select)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_move == true:
		position.y += movespeed*delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Bullet:
		queue_free()
	




func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area is Bullet_area:
		Autoload.Score +=1
		if is_ammo_zombie == true:
			Autoload.bullet_count += 5
			queue_free()
		else:
			queue_free()
		
func game_over_movement():
	can_move = false
	$Sprite.stop()
	


func _on_detector_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area is detection:
		if is_tank_zombie == true:
			Autoload.player_health -= 2
		else:
			Autoload.player_health -= 1

func flash():
	$Sprite.modulate = Color(3, 3, 3) 
	await get_tree().create_timer(0.08).timeout
	$Sprite.modulate = Color(1, 1, 1) 

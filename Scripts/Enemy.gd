class_name Enemy extends Node2D
const movespeed = 80
var rand_num = randi_range(0,2)
var is_ammo_zombie : bool = false
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
		
	var ammo = randi_range(1,20)
	if ammo > 19:
		$Sprite.play("walk")
		$Sprite.modulate.a =0.5
		is_ammo_zombie = true
	else:
		is_ammo_zombie = false
		$Sprite.modulate.a = 1
		print(ammo)


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

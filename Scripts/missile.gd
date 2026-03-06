class_name Enemy extends Node2D
const movespeed = 30
var rand_num = randi_range(0,2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("Walk")
	
	position.y = -20
	if rand_num == 0: 
		position.x = 60
	elif rand_num == 1:
		position.x = 180
	else:
		position.x = 300
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	position.y += movespeed*delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Player or body is Bullet:
		queue_free()
	




func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if area is Bullet_area:
		Autoload.Score +=1
		
		queue_free()
		
		

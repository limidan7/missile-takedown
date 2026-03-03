extends Node2D
const movespeed = 30
var rand_num = randi_range(0,2)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	position.y = -50
	if rand_num == 0: 
		position.x = 60
	elif rand_num == 1:
		position.x = 180
	else:
		position.x = 300
	print(position.x)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += movespeed*delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		queue_free()

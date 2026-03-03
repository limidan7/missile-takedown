extends CharacterBody2D

var current_lane = 0
var lane_position = [60, 180,300]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Right_Move") and current_lane < 2:
		current_lane += 1
	if Input.is_action_just_pressed("Left_Move") and current_lane >0:
		current_lane -= 1
	
	
	position.x = lane_position[current_lane]

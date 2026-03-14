class_name Player extends CharacterBody2D


var can_move:bool = true
var cooldown: bool = false
var move_changes = 0
@onready var timer = $Timer
var position_changed = false
var current_lane = 0
var lane_position = [36,107.5,180,252.5,300]
var bullet_scene = preload("res://Scenes/bullet.tscn")
@onready var lefttouch = $"../CanvasLayer/LeftTouchZone"
@onready var righttouch = $"../CanvasLayer/RightTouchZone"
@onready var middletouch = $"../CanvasLayer/MiddleTouchZone"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 0.5
	timer.start()
	Autoload.game_over.connect(haltmovement)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if can_move == true:
		if (Input.is_action_just_pressed("Right_Move") or righttouch.pressed) and current_lane < 4:
			current_lane += 1
			righttouch.pressed = false
		if (Input.is_action_just_pressed("Left_Move") or lefttouch.pressed) and current_lane >0:
			current_lane -= 1
			lefttouch.pressed = false
		
		shoot()
		position.x = lane_position[current_lane]
	
	
func shoot():
	if Autoload.bullet_count > 0:
		if cooldown == false:
			if Input.is_action_just_pressed("Shoot") or middletouch.pressed:
				spawn_bullets()
				middletouch.pressed
	
func spawn_bullets():
		var bullet_instance = bullet_scene.instantiate()
		add_sibling(bullet_instance)
		bullet_instance.global_position.x = global_position.x
		timer.start()
		Autoload.bullet_count -= 1
		cooldown = true
		


func _on_timer_timeout() -> void:
	cooldown = false

func haltmovement():
	can_move = false
	
	

extends Node2D
var can_spawn : bool = true
@onready var timer = $Timer
var missile = preload("res://Scenes/missile.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:#start the timer to spawn the missiles
	Autoload.game_over.connect(spawner_toggle)
	timer.wait_time = 3
	timer.start
	timer.timeout.connect(spawner)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer.wait_time < 1:
		timer.wait_time = 1
	pass
func spawner():
	if can_spawn == true:#spawn the missiles
		var missile_instantiate = missile.instantiate()
		add_child(missile_instantiate)
		timer.wait_time *= 0.9
	
func spawner_toggle():
	can_spawn = false

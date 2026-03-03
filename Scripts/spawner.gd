extends Node2D

@onready var timer = $Timer
var missile = preload("res://Scripts/missile.gd")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 1
	timer.start
	timer.timeout.connect(spawner)
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func spawner():
	var missile_instantiate = missile.instantiate
	add_child(missile_instantiate)

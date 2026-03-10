extends Node
var bullet_count:int 
var Score:int = 0 
var player_health: int
signal game_over 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bullet_count = 20
	player_health = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_health < 1:
		game_over.emit()
		

extends Label

var game_over_label : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Autoload.game_over.connect(GAMEOVER)
	game_over_label = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if game_over_label == false:
		text = str(Autoload.player_health)

func GAMEOVER():
	game_over_label = true
	text = "GAMEOVER"

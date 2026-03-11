extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate.a = 0
	Autoload.game_over.connect(deathtint)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func deathtint ():
	modulate.a = 0
	create_tween().tween_property(self, "modulate:a", 0.8 , 3)

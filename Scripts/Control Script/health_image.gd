extends TextureRect

var broken:bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")
	Autoload.game_over.connect(HeartBreak)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func HeartBreak():
	if broken == false:
		$AnimatedSprite2D.play("Briste")
		await $AnimatedSprite2D.animation_finished
		broken = true
		

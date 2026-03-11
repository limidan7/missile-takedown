extends Control


var pressed = false

func _gui_input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			pressed = true
		else:
			pressed = false

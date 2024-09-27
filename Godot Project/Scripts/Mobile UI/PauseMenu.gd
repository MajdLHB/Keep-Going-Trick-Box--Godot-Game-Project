extends Button

func _process(delta):
	Variables.PauseButton = false

func _on_pressed():
	Variables.PauseButton = true

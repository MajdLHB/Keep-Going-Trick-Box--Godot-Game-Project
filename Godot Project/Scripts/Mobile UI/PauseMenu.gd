extends Button
var Thescript


func _process(delta):
	Variables.PauseButton = false


func _on_pressed():
	Thescript = get_node("/root/Level/PauseMenu")
	Variables.PauseButton = true
	Thescript.MenuShowing()

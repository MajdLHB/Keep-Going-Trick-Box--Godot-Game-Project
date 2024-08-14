extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "OnPressed"))
	$"../../../../VBoxContainer".visible = false
	self.set_focus_mode(Control.FOCUS_ALL)	

func OnPressed():
	if Variables.Activate_button == true:
		$"../../../../VBoxContainer".visible = true
		$"../../../../VBoxContainer/Pannel3/ExitBUT".grab_focus()
		Variables.Activate_button = false

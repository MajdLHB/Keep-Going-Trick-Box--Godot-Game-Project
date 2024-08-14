extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "OnPressed"))
	$"../../../../Pannel2".visible = false
	self.set_focus_mode(Control.FOCUS_ALL)	



func OnPressed():
	if Variables.Activate_button == true:
		$"../../../../Pannel2".visible = true
		$"../../../../Pannel2/Exit".grab_focus()
		Variables.Activate_button = false

extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "OnPressed"))
	$"../../VBoxContainer2".visible = false

func OnPressed():
	$"../../VBoxContainer2".visible = true
	$"../../VBoxContainer2/Pannel3/ExitBUT".grab_focus()
	

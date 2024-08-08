extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "OnPressed"))
	$"../../../../Pannel2".visible = false

func OnPressed():
	$"../../../../Pannel2".visible = true
	$"../../../../Pannel2/Exit".grab_focus()

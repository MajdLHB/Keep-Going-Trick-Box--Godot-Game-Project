extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("pressed", Callable(self, "OnPressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func OnPressed():
	get_tree().quit()

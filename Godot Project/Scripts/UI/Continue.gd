extends Button

func _DisableButton():
	self.disabled = true
	self.set_focus_mode(Control.FOCUS_NONE)

func _EnableButton():
	self.disabled = false
	self.set_focus_mode(Control.FOCUS_ALL)	

func _ready():
	_DisableButton()
	self.connect("pressed", Callable(self, "OnPressed"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if SaveManager.SavedGame:
		_EnableButton()


func OnPressed():
	if Variables.Activate_button == true:
		SceneManager._Load(SaveManager.Level)

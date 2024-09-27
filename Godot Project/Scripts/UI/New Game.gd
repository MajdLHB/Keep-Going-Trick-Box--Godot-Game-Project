extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	Variables.InFirstOrSecondScene = true
	grab_focus()
	self.connect("pressed", Callable(self, "OnPressed"))
	self.set_focus_mode(Control.FOCUS_ALL)	


func OnPressed():
	if Variables.Activate_button == true:
		SaveManager.SavedGame = true
		SaveManager.Level = SceneManager.FirstLevelIndex
		SceneManager.CurrentIndex = SceneManager.FirstLevelIndex
		SaveManager.SaveData()
		SceneManager._Load(SceneManager.FirstLevelIndex)




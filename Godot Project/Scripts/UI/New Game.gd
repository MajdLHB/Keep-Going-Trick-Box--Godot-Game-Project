extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	grab_focus()
	self.connect("pressed", Callable(self, "OnPressed"))

func OnPressed():
	SaveManager.SavedGame = true
	SaveManager.Level = SceneManager.FirstLevelIndex
	SceneManager.CurrentIndex = SceneManager.FirstLevelIndex
	SaveManager.SaveData()
	SceneManager._Load(SceneManager.FirstLevelIndex)




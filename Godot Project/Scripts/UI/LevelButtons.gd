extends Button
var LevelNUm

# Called when the node enters the scene tree for the first time.
func _ready():

	LevelNUm = int(self.text)
	self.connect("pressed", Callable(self, "OnPressed"))
	if SaveManager.Level >= LevelNUm + 1:
		self.disabled = false
	elif SaveManager.Level < LevelNUm + 1:
		self.disabled = true




func OnPressed():
	SaveManager.Level = LevelNUm
	SceneManager._Load(SaveManager.Level + 1)

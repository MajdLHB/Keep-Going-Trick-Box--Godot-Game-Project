extends HBoxContainer



# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(3.0).timeout 
	$AnimationPlayer.play("fade out")
	SaveManager.Level = SceneManager.FirstLevelIndex
	SceneManager.CurrentIndex = SaveManager.Level
	SaveManager.SaveData()
	SaveManager.LoadData()

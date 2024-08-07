extends HBoxContainer



# Called when the node enters the scene tree for the first time.
func _ready():
	SceneManager.CurrentIndex = SaveManager.Level
	SaveManager.SaveData()
	SaveManager.LoadData()
	$AnimationPlayer.play("fade_in")
	await get_tree().create_timer(3.0).timeout 
	$AnimationPlayer.play("fade out")



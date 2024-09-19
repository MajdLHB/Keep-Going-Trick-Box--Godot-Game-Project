extends Area3D

var Entered = false
var Exited = false
var EntereToSecondArea = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Entered = false
	Exited = false
	EntereToSecondArea = false
	connect("body_entered", Callable(self, "_OnBodyEntered")) 
	connect("body_exited", Callable(self, "_OnBodyExited"))
	$Area3D.connect("body_entered" , Callable(self, "_OnBodyEntered2"))
	

func _OnBodyEntered(area):
	if area.name == "Player":
		Entered = true

func _OnBodyExited(area):
	if area.name == "Player":
		Exited = true

func _OnBodyEntered2(area):
	if area.name == "Player":
		EntereToSecondArea = true

func SetPos():
	var CAMERA3D = $"../../Camera3D"
	CAMERA3D.smoothing_speed = 100.0
	$"../../Player".position = Vector3(0.0, 22, -1.327)
	$"../../Display Level/CanvasLayer/HBoxContainer/AnimationPlayer".play("fade_in")
	await get_tree().create_timer(3.0).timeout 
	CAMERA3D.smoothing_speed = 5.0
	$"../../Display Level/CanvasLayer/HBoxContainer/AnimationPlayer".play("fade out")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if SaveManager.Level  == 4:
		if Exited and EntereToSecondArea:
			Entered = false
			Exited = false
			EntereToSecondArea = false
			print("CI: " + str(SceneManager.CurrentIndex))
			SceneManager.CurrentIndex += 1
			SaveManager.Level = SceneManager.CurrentIndex  
			SaveManager.SaveData()
			SaveManager.LoadData()
			SceneManager._Load(SceneManager.CurrentIndex)
		elif not Exited and EntereToSecondArea:
			Entered = false
			Exited = false
			EntereToSecondArea = false
			SetPos()
	else:
		if Exited and EntereToSecondArea:
			Entered = false
			Exited = false
			EntereToSecondArea = false
			print("CI: " + str(SceneManager.CurrentIndex))
			SceneManager.CurrentIndex += 1
			SaveManager.Level = SceneManager.CurrentIndex 
			SaveManager.SaveData()
			SaveManager.LoadData()
			SceneManager._Load(SceneManager.CurrentIndex)
		elif not Exited and EntereToSecondArea:
			Entered = false
			Exited = false
			EntereToSecondArea = false
			SceneManager._Load(SceneManager.CurrentIndex)


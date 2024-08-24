extends Node

# Making a list of scenes
var Scenes = [
	"res://Scenes/UI1stScene.tscn",
	"res://Scenes/Level-Select.tscn",
	"res://Scenes/1stLevel.tscn",
	"res://Scenes/2ndLevel.tscn",
	"res://Scenes/3rdLevel.tscn"
]

var FirstSceneIndex = 0
var CurrentIndex = 0
var SvaGameLevel
var FirstLevelPath = Scenes[2]
var FirstLevelIndex = 2
var LastLevelIndex = 4


func _Load(Scene_index):
	if Scene_index < Scenes.size():
		var ScenePath = Scenes[Scene_index]
		get_tree().change_scene_to_file(ScenePath)


func _ready():
	var CurrentIndex = SaveManager.Level
	_Load(FirstSceneIndex)
	

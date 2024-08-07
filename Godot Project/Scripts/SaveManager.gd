extends Node

var SaveFile = "res://SaveGame/GameData.json"
var SavedGame = false
var Level = 1
var PlayerData = {
}

func UpdateVar():
	PlayerData = {
	"Level": Level,
	"SavedGame": SavedGame
}

func LoadData():
	UpdateVar()
	var file = FileAccess.open(SaveFile, FileAccess.READ)
	var LevelData = JSON.parse_string(file.get_as_text())
	Level = LevelData["Level"]
	SavedGame = LevelData["SavedGame"]
	UpdateVar()
	return LevelData 

func SaveData():
	UpdateVar()
	var file = FileAccess.open(SaveFile, FileAccess.WRITE)
	var Json_Data = JSON.stringify(PlayerData)
	if file:
		file.store_string(Json_Data)
		file.close()
	SavedGame = true


func _ready():
	LoadData()



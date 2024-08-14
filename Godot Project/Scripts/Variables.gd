extends Node

var Activate_button = true
var VSYNC = false
var Resolution = "1920x1080"
var FullScreen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Set_Settings()


func Set_Settings():
	if VSYNC == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	elif VSYNC == false:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	var Xindex = Resolution.find("x")
	var FirstResolution = Resolution.substr(0, Xindex)
	var SecondResolution = Resolution.substr(Xindex + 1, Resolution.length())
	var width = FirstResolution.to_int()
	var height = SecondResolution.to_int()
	print(width)
	print(height)
	ProjectSettings.set("display/mouse_cursor/custom_image", "res://Images/Mouse cursor/Cursor.jpg")
	DisplayServer.window_set_size(Vector2i(FirstResolution.to_int(), SecondResolution.to_int()))


extends Node

var Activate_button = true
var VSYNC = false
var Resolution = "1280x720"
var selected_resolution_ID = 0
var FullScreen = false
var settings_file_path = "res://Settings file/Settinggs.cfg"
var config = ConfigFile.new()
var JoystickMovement: Vector2
var JumpButton = false
var PauseButton = false
var InFirstOrSecondScene = false




# Called when the node enters the scene tree for the first time.
func _ready():
	config.load(settings_file_path)
	_load_settings()
	Set_Settings()
	_save_settings()
	JoystickMovement= Vector2(0, 0)




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
	if FullScreen == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif FullScreen == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _save_settings():
	config.set_value("display", "vsync", VSYNC)
	config.set_value("display", "resolution", Resolution)
	config.set_value("display", "red_Id", selected_resolution_ID)
	config.set_value("display", "fullscreen", FullScreen)
	config.save(settings_file_path)
	
func Load_Vsync():
	VSYNC = config.get_value("display", "vsync")

func Load_Resolution():
	Resolution = config.get_value("display", "resolution")

func Load_res_ID():
	selected_resolution_ID = config.get_value("display", "red_Id")
	print(selected_resolution_ID)

func Load_FullScreen():
	FullScreen = config.get_value("display", "fullscreen")

func _load_settings():
	Load_Vsync()
	Load_Resolution()
	Load_res_ID()
	Load_FullScreen()

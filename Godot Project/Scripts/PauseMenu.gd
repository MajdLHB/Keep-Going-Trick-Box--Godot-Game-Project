extends Node2D

var Pressed = false

func _ready():
	Pressed = false
	$CanvasLayer.visible = false

func _physics_process(delta):
	if Input.is_action_just_pressed("Pause"):
		Pressed = !Pressed  
		$CanvasLayer.visible = Pressed 
		if Pressed:
			Engine.time_scale = 0.0  
		else:
			Engine.time_scale = 1.0  

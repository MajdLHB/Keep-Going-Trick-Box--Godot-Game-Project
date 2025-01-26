extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var player = "././Player"
	var Player = get_node("/root/Level/Player")
	Variables.JumpButton = false
	


func _on_pressed():
	Variables.JumpButton = true
	var Player = get_node("/root/Level/Player")
	Player.Jump()

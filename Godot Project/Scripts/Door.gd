extends StaticBody3D

var ClosedDoorPosition 
var OpenedDoorPosition
var TargetPosition
var SPEED = 5.0

# Called when the scene is ready
func _ready():
	ClosedDoorPosition = transform.origin
	TargetPosition = ClosedDoorPosition
	OpenedDoorPosition = ClosedDoorPosition + Vector3(0, -2.5, 0)

# Called every frame
func _physics_process(delta):
	transform.origin = lerp(transform.origin, TargetPosition, SPEED * delta)

# Opening the door
func Open_Door():
	TargetPosition = OpenedDoorPosition

# Closing the door
func Close_Door():
	TargetPosition = ClosedDoorPosition
	


func _on_buttons_open_door():
	pass # Replace with function body.

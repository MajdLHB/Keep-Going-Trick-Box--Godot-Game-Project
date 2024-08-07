extends StaticBody3D

# Creating Signals to talk with the door
signal OpenDoor
signal CloseDoor

# Crating a variable for the initial position
var initial_position 
var ObjectsInTheArea = 0
var Pressed_Position 

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = $MeshInstance3D.transform.origin
	Pressed_Position = initial_position + Vector3(0, -0.2, 0)
	$Area3D.connect("body_entered", Callable( self, "_OnAreaEntered"))
	$Area3D.connect("body_exited", Callable(self, "_OnAreaExited"))

	
# Called when an object enters the area
func _OnAreaEntered(area):
	ObjectsInTheArea += 1
	if ObjectsInTheArea == 0:
		$MeshInstance3D.transform.origin = initial_position
		emit_signal("CloseDoor")
	elif ObjectsInTheArea > 0:
		$MeshInstance3D.transform.origin = Pressed_Position
		emit_signal("OpenDoor")	

# Called when an object exits the area
func _OnAreaExited(area):
	ObjectsInTheArea -= 1
	if ObjectsInTheArea == 0:
		$MeshInstance3D.transform.origin = initial_position
		emit_signal("CloseDoor")
	elif ObjectsInTheArea > 0:
		$MeshInstance3D.transform.origin = Pressed_Position
		emit_signal("OpenDoor")	


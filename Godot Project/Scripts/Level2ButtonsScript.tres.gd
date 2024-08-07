extends Node3D

# Creating Signals to talk with the door
signal OpenDoor
signal CloseDoor

#Button 1:
var initial_position1 
var ObjectsInTheArea1 = 0
var Pressed_Position1
var B1 = false
#Button 2:
var initial_position2 
var ObjectsInTheArea2 = 0
var Pressed_Position2
var B2 = false
#Button 3:
var initial_position3
var ObjectsInTheArea3 = 0
var Pressed_Position3
var B3 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#button1:
	initial_position1 = $Button1/MeshB1.transform.origin
	Pressed_Position1 = initial_position1 + Vector3(0, -0.2, 0)
	$Button1/AreaB1.connect("body_entered", Callable( self, "_OnArea1Entered"))
	$Button1/AreaB1.connect("body_exited", Callable(self, "_OnArea1Exited"))
	#button2:
	initial_position2 = $Button2/MeshB2.transform.origin
	Pressed_Position2 = initial_position2 + Vector3(0, -0.2, 0)
	$Button2/AreaB2.connect("body_entered", Callable( self, "_OnArea2Entered"))
	$Button2/AreaB2.connect("body_exited", Callable(self, "_OnArea2Exited"))
	#button3:
	initial_position3 = $Button3/MeshB3.transform.origin
	Pressed_Position3 = initial_position3 + Vector3(0, -0.2, 0)
	$Button3/AreaB3.connect("body_entered", Callable( self, "_OnArea3Entered"))
	$Button3/AreaB3.connect("body_exited", Callable(self, "_OnArea3Exited"))

	
# Called when an object enters the area
func _OnArea1Entered(area):
	ObjectsInTheArea1 += 1
	if ObjectsInTheArea1 == 0:
		$Button1/MeshB1.transform.origin = initial_position1
		emit_signal("CloseDoor")
	elif ObjectsInTheArea1 > 0:
		$Button1/MeshB1.transform.origin = Pressed_Position1
	if area.name == "Box3":
		B1 = true

# Called when an object exits the area
func _OnArea1Exited(area):
	ObjectsInTheArea1 -= 1
	if ObjectsInTheArea1 == 0:
		$Button1/MeshB1.transform.origin = initial_position1
		emit_signal("CloseDoor")
	elif ObjectsInTheArea1 > 0:
		$Button1/MeshB1.transform.origin = Pressed_Position1
		if area.name == "Box3":
			B1 = false
	

func _OnArea2Entered(area):
	ObjectsInTheArea2 += 1
	if ObjectsInTheArea2 == 0:
		$Button2/MeshB2.transform.origin = initial_position2
		emit_signal("CloseDoor")
	elif ObjectsInTheArea2 > 0:
		$Button2/MeshB2.transform.origin = Pressed_Position2
	if area.name == "Box1":
		B2 = true

# Called when an object exits the area
func _OnArea2Exited(area):
	ObjectsInTheArea2 -= 1
	if ObjectsInTheArea2 == 0:
		$Button2/MeshB2.transform.origin = initial_position2
		emit_signal("CloseDoor")
	elif ObjectsInTheArea2 > 0:
		$Button2/MeshB2.transform.origin = Pressed_Position2
		if area.name == "Box1":
			B2 = false

func _OnArea3Entered(area):
	ObjectsInTheArea3 += 1
	if ObjectsInTheArea3 == 0:
		$Button3/MeshB3.transform.origin = initial_position3
		emit_signal("CloseDoor")
	elif ObjectsInTheArea3 > 0:
		$Button3/MeshB3.transform.origin = Pressed_Position3
	if area.name == "Box2":
		B3 = true

# Called when an object exits the area
func _OnArea3Exited(area):
	ObjectsInTheArea3 -= 1
	if ObjectsInTheArea3 == 0:
		$Button3/MeshB3.transform.origin = initial_position3
		emit_signal("CloseDoor")
	elif ObjectsInTheArea3 > 0:
		$Button3/MeshB3.transform.origin = Pressed_Position3
		if area.name == "Box2":
			B3 = false





func _physics_process(delta):
	if B1 and B2 and B3:
		emit_signal("OpenDoor")

extends Node3D

@export var Pannel: Node3D
var velocity = Vector3(0,0,0)
var SPEED = 2.5

# button1:
var initial_position1 
var ObjectsInTheArea1 = 0
var Pressed_Position1 
var B1 = false
# button2:
var initial_position2
var ObjectsInTheArea2 = 0
var Pressed_Position2
var B2 = false
# button3:
var initial_position3
var ObjectsInTheArea3 = 0
var Pressed_Position3
var B3 = false
# button4:
var initial_position4
var ObjectsInTheArea4 = 0
var Pressed_Position4
var B4 = false


# Called when the node enters the scene tree for the first time.
func _ready():
	#Button1
	initial_position1 = $Button1/MeshB1.transform.origin
	Pressed_Position1 = initial_position1 + Vector3(0, -0.2, 0)
	$Button1/AreaB1.connect("body_entered", Callable( self, "_OnArea1Entered"))
	$Button1/AreaB1.connect("body_exited", Callable(self, "_OnArea1Exited"))
	#Button2
	initial_position2 = $Button2/MeshB2.transform.origin
	Pressed_Position2 = initial_position2 + Vector3(0, -0.2, 0)
	$Button2/AreaB2.connect("body_entered", Callable( self, "_OnArea2Entered"))
	$Button2/AreaB2.connect("body_exited", Callable(self, "_OnArea2Exited"))
	#Button3
	initial_position3 = $Button3/MeshB3.transform.origin
	Pressed_Position3 = initial_position3 + Vector3(0, -0.2, 0)
	$Button3/AreaB3.connect("body_entered", Callable( self, "_OnArea3Entered"))
	$Button3/AreaB3.connect("body_exited", Callable(self, "_OnArea3Exited"))
	#Button4
	initial_position4 = $Button4/MeshB4.transform.origin
	Pressed_Position4 = initial_position4 + Vector3(0, -0.2, 0)
	$Button4/AreaB4.connect("body_entered", Callable( self, "_OnArea4Entered"))
	$Button4/AreaB4.connect("body_exited", Callable(self, "_OnArea4Exited"))

	
# Called when an object enters the area
func _OnArea1Entered(area):
	ObjectsInTheArea1 += 1
	if ObjectsInTheArea1 == 0:
		$Button1/MeshB1.transform.origin = initial_position1
		B1 = false
	elif ObjectsInTheArea1 > 0:
		$Button1/MeshB1.transform.origin = Pressed_Position1
		B1= true

# Called when an object exits the area
func _OnArea1Exited(area):
	ObjectsInTheArea1 -= 1
	if ObjectsInTheArea1 == 0:
		$Button1/MeshB1.transform.origin = initial_position1
		B1 = false
	elif ObjectsInTheArea1 > 0:
		$Button1/MeshB1.transform.origin = Pressed_Position1
		B1= true

func _OnArea2Entered(area):
	ObjectsInTheArea2 += 1
	if ObjectsInTheArea2 == 0:
		$Button2/MeshB2.transform.origin = initial_position2
		B2 = false
	elif ObjectsInTheArea2 > 0:
		$Button2/MeshB2.transform.origin = Pressed_Position2
		B2= true

# Called when an object exits the area
func _OnArea2Exited(area):
	ObjectsInTheArea2 -= 1
	if ObjectsInTheArea2 == 0:
		$Button2/MeshB2.transform.origin = initial_position2
		B2 = false
	elif ObjectsInTheArea2 > 0:
		$Button2/MeshB2.transform.origin = Pressed_Position2
		B2= true

func _OnArea3Entered(area):
	ObjectsInTheArea3 += 1
	if ObjectsInTheArea3 == 0:
		$Button3/MeshB3.transform.origin = initial_position3
		B3 = false
	elif ObjectsInTheArea3 > 0:
		$Button3/MeshB3.transform.origin = Pressed_Position3
		B3= true

# Called when an object exits the area
func _OnArea3Exited(area):
	ObjectsInTheArea3 -= 1
	if ObjectsInTheArea3 == 0:
		$Button3/MeshB3.transform.origin = initial_position3
		B3 = false
	elif ObjectsInTheArea3 > 0:
		$Button3/MeshB3.transform.origin = Pressed_Position3
		B3= true

func _OnArea4Entered(area):
	ObjectsInTheArea4 += 1
	if ObjectsInTheArea4 == 0:
		$Button4/MeshB4.transform.origin = initial_position4
		B4 = false
	elif ObjectsInTheArea4 > 0:
		$Button4/MeshB4.transform.origin = Pressed_Position4
		B4= true

# Called when an object exits the area
func _OnArea4Exited(area):
	ObjectsInTheArea4 -= 1
	if ObjectsInTheArea4 == 0:
		$Button4/MeshB4.transform.origin = initial_position4
		B4 = false
	elif ObjectsInTheArea4 > 0:
		$Button4/MeshB4.transform.origin = Pressed_Position4
		B4= true

func _physics_process(delta):
	if B1:
		velocity = Vector3(0, 0, SPEED)
	elif B2:
		velocity = Vector3(0, 0, -SPEED)
	elif B3:
		velocity = Vector3(SPEED, 0, 0)
	elif B4:
		velocity = Vector3(-SPEED, 0, 0)
	else:
		velocity = lerp(velocity, Vector3(0,0,0), 0.1)
		
	Pannel.translate(velocity * delta) 

extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var Velocity = Vector3(0, 0, 0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_pressed("MoveForward") and Input.is_action_pressed("MoveBackward"):
		velocity.z = 0
	elif Input.is_action_pressed("MoveForward"):
		velocity.z = SPEED
	elif Input.is_action_pressed("MoveBackward"):
		velocity.z = -SPEED
	else:
		velocity.z = lerp(velocity.z,0.0,0.1)
	
	if Input.is_action_pressed("MoveRight") and Input.is_action_pressed("MoveLeft"):
		velocity.x = 0
	elif Input.is_action_pressed("MoveRight"):
		velocity.x = -SPEED
	elif Input.is_action_pressed("MoveLeft"):
		velocity.x = SPEED
	else:
		velocity.x= lerp(velocity.x,0.0,0.1)

		

	move_and_slide()

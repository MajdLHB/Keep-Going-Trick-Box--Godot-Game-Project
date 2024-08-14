extends Camera3D

# The target to follow
@export var target: Node3D

# The speed of the camera interpolation
@export var smoothing_speed: float = 5.0

# Offset from the target
@export var offset: Vector3 = Vector3(0, 5, -10)



func _process(delta):
	if target.global_transform.origin.y > 0.1:
		smoothing_speed = 5.0
	elif target.global_transform.origin.y < 0:
		smoothing_speed = 10.0
		
	if target:
		# Calculate the desired position
		var target_position = target.global_transform.origin + offset
		# Interpolate smoothly towards the target position
		global_transform.origin = global_transform.origin.lerp(target_position, smoothing_speed * delta)

extends Sprite2D

var IsPressed = false
var MaxLength = 135
var DeadZone = 1
@onready var parent = $"../Joystick"
var intialpos: Vector2
var IntialJoystickButtonPos = Vector2(207, 881)

func _ready():
	MaxLength *= $"..".scale.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	intialpos = Vector2(207, 881)
	if IsPressed:
		if get_global_mouse_position().distance_to(intialpos) <= MaxLength: 
			self.global_position = get_global_mouse_position()
		elif get_global_mouse_position().distance_to(intialpos) > MaxLength: 
			self.global_position = ((get_global_mouse_position()-intialpos).normalized() * MaxLength) + intialpos 
		calculate()
	else:
		self.global_position = lerp(self.global_position, intialpos, 0.7)
		Variables.JoystickMovement = Vector2(0,0)
		
func calculate():
	if abs((self.global_position.x - intialpos.x)) >= DeadZone:
		Variables.JoystickMovement.x = (intialpos.x - self.global_position.x) / MaxLength
	if abs((self.global_position.y - intialpos.y)) >= DeadZone:
		Variables.JoystickMovement.y = (intialpos.y - self.global_position.y) / MaxLength
		
func _on_joystick_button_down():
	IsPressed = true

func _on_joystick_button_up():
	IsPressed = false



extends CharacterBody2D

# Variables
@export var jump_height = -20
@export var movement_speed = 60
const gravity = 100
const TERMINAL_VELOCITY = 700


func _physics_process(delta):
	movement()
	
	# This is gravity
	if not is_on_floor():
		velocity.y += gravity * delta



# Movement script
func movement():
	var input_direction = Input.get_action_strength("Right") - Input.get_action_strength("Left")

	velocity.x = input_direction * movement_speed
	
	if is_on_floor() and Input.get_action_strength("Jump"):
		velocity.y += jump_height
	
	
	move_and_slide()

extends CharacterBody2D

# Variables
@export var jump_height = 5000
@export var water_jump_height = 1000
@export var movement_speed = 100
@export var terminal_velocity = 1000
var max_double = 0

var water_level = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	movement()
	water_jump()
	move_and_slide()
	
	
		# This is gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		
		velocity.y = min(velocity.y, terminal_velocity)

func sucking_water():
	pass

func water_jump():
	pass
	if !is_on_floor() and water_level >= 0 and Input.is_action_just_pressed("Jump"):
		velocity.y = 0
		velocity.y += water_jump_height + velocity.y
		water_level -= 25


# Movement script
func movement():
	# Moveing left and right
	var input_direction = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	velocity.x = input_direction * movement_speed
	
		
	# Jumping normaly
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y += jump_height
	
	# Making jumping ajustable
	if Input.is_action_just_released("Jump"):
		velocity.y *= 0.5

extends CharacterBody2D

var input
@export var speed = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# JUMPING VARIBALES

@export var jump_force = 500
@export var max_jump = 2
var jump_count = 0
var double_jump = PlayerStats.double_jump


func _process(delta: float) -> void:
	movement()

func movement():
	input = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	
	if input != 0:
		if input > 0:
			velocity.x += speed
			velocity.x = clamp(speed, 100.0, speed)
			$Sprite2D.scale.x = 1
		if input < 0:
			velocity.x -= speed
			velocity.x = clamp(speed, -100.0, speed)
			$Sprite2D.scale.x = -1
	
	if input == 0:
		velocity.x = 0
		
		
# code for jumping

	if is_on_floor():
		jump_count = 0

	if Input.is_action_pressed("Jump") && is_on_floor() && jump_count < max_jump:
		jump_count += 1
		velocity.y -= jump_force
		velocity.x = input
		
	if !is_on_floor() && Input.is_action_just_pressed("Jump") && jump_count < max_jump:
		jump_count += 1
		velocity.y -= jump_force
		velocity.x = input
	
	
	if !is_on_floor() && Input.is_action_just_released("Jump") && jump_count < max_jump:
		velocity.y = gravity
		velocity.x = input

	
	gravity_forced()
	move_and_slide()


func gravity_forced():
	velocity.y += gravity

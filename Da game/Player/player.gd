extends CharacterBody2D

const FALL_GRAVITY = 2000
const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@onready var sprite_2d = $Sprite2D

func _physics_process(delta: float) -> void:
	#animations
	

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	# Handle jump.
	
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 8
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#main menu
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)

	move_and_slide()

	if velocity.x < 0:
		sprite_2d.flip_h = true 
	if velocity.x > 0:
		sprite_2d.flip_h = false 

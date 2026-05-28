extends CharacterBody2D
# Export Variables
@export var jump_height = -430
@export var water_jump_height = 1000
var movement_speed = 200
@export var terminal_velocity = 1000
@export var shoot_height = -860

# Onready Varibles
@onready var water_timer: Timer = $water_shoot
@onready var water_shoot_progress_bar: ProgressBar = $"CanvasLayer/Player ui/ProgressBar"
@onready var walk_sounds: AudioStreamPlayer = $Sounds/Walk_Sounds
@onready var player: CharacterBody2D = $"."

var step_timer = 0.0
var step_delay = 6.2 # Time in seconds between steps

# checks for abilities
var water_shoot_check = false
var wall_jump_check = false
var wall_check = false


var water_level = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var health = PlayerStats.health


func _physics_process(delta):
	movement(delta)
	ability_check()
	if water_shoot_check == true:
		water_shoot()

	if not is_on_floor() and wall_check == false:
		velocity.y += gravity * delta
		velocity.y = min(velocity.y, terminal_velocity)
	move_and_slide()

func sucking_water():
	pass

func water_jump():
	pass
	if !is_on_floor() and water_level >= 0 and Input.is_action_just_pressed("Jump"):
		velocity.y = 0
		velocity.y += water_jump_height + velocity.y
		water_level -= 25

# your big jump ability
func water_shoot():
	
# updating the progress bar so that you cna visually see the chagne in charge up time
	water_shoot_progress_bar.value = water_timer.wait_time - water_timer.time_left
	water_shoot_progress_bar.max_value = water_timer.wait_time
	# checking if the input is held
	if Input.is_action_just_pressed("Water_shoot"):
		water_timer.start()
		water_shoot_progress_bar.visible = true
	if Input.is_action_just_released("Water_shoot"):
		water_timer.stop()

		water_shoot_progress_bar.visible = false

# Checking if you got an ability

func ability_check():
	water_shoot_check = PlayerStats.water_shoot
	wall_jump_check = PlayerStats.wall_jump



# Movement script
func movement(delta):
	# Moveing left and right
	var input_direction = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	velocity.x = input_direction * movement_speed
	
	
# We check velocity.x (horizontal speed) instead of total length 
	# so falling down a pit doesn't trigger footsteps.
	if velocity.x != 0.0 and is_on_floor():
		step_timer -= delta
		if step_timer <= 0:
			walk_sounds.play()
			step_timer = step_delay
	else:
		# Reset timer when mid-air or standing still
		step_timer = 0.0
		walk_sounds.stop()
		
		
	# Jumping normaly
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y += jump_height
	
	# Making jumping ajustable
	if Input.is_action_just_released("Jump"):
		velocity.y *= 0.5
	
	
	

func wall_climb():
	pass
	

func _on_water_shoot_timeout() -> void:
	print("shot player")

	velocity.y += shoot_height
	water_shoot_progress_bar.visible = false


func _on_wall_climb_body_entered():
	print("Touching")

extends Node

@export var player_pos: Vector2
@export var health = 10
@export var water_jump: bool

var water_shoot = false
var bubble_up = false
var max_water_level = 500
var wall_jump = false

var current_scene = null

func get_scene():
	var root = get_tree().root
	current_scene = root.get_child(-1).name

func _physics_process(_delta: float) -> void:
	get_scene()
	ability()


func ability():
	if "Level 3" in current_scene:
		water_shoot = true
	if "Level 4" in current_scene:
		wall_jump = true

class_name PlayerStat
extends Node

@export var player_pos: Vector2
@export var health: int
@export var water_jump: bool


# Make sure that every parameter has a default value.
# Otherwise, there will be problems with creating and editing
# your resource via the inspector.
func _init(p_health = 0, p_pos = Vector2.ZERO, p_water_jump = null):
	health = p_health
	player_pos = p_pos
	water_jump = p_water_jump

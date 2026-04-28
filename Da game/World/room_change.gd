extends Area2D

@export_file("*.tscn") var target_scene_path # Allows picking the scene in the Inspector

func _on_body_entered(body):
	if body.is_in_group("Player"): # Ensure only the player triggers it
		print("In area")
		Global.goto_scene(target_scene_path)

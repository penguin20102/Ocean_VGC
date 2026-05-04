extends Area2D

@export_file("*.tscn") var target_scene_path # Allows picking the scene in the Inspector

func _on_body_entered(body):
	if body.is_in_group("Player"): # Ensure only the player triggers it
		print("Change to room" + target_scene_path)
		Global.goto_scene(target_scene_path)


func do_fade_out() -> void:
	# start the fade animation
	$AnimationPlayer.play("fade")
	
	# wait for the animation to finish before continuing
	await $AnimationPlayer.animation_finished
	
	# do the next thing
	

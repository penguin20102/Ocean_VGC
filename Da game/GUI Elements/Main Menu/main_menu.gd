extends Control


func _on_play_pressed():
	Global.goto_scene("res://World/world.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()

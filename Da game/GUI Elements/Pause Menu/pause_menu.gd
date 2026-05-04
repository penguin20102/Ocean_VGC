extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		resume()


func _on_resume_pressed():
	resume()

func _on_settings_pressed():
	load("res://GUI Elements/Settings/settings.tscn")

func _on_main_menu_pressed():
	Global.goto_scene("res://GUI Elements/Main Menu/main_menu.tscn")

func _process(_delta):
	testEsc()

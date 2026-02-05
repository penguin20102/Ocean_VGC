extends Control

var saved_volume: float = 0.0 

func _on_h_slider_value_changed(new_value: float) -> void:
	saved_volume = new_value
	
	AudioServer.set_bus_volume_db(0, saved_volume)


func _on_mute_box_toggled(toggled_on: bool):
	if toggled_on:
		AudioServer.set_bus_volume_db(0, -80)
	else:
		AudioServer.set_bus_volume_db(0, saved_volume)

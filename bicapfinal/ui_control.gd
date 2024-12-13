extends Control



func _on_button_pressed() -> void:
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	PlayerPos.current_scene = "earth"
	get_tree().change_scene_to_file("res://Environments/earth.tscn")
	

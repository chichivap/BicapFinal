extends Node2D

var entered : bool = false

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		if entered:
			if PlayerPos.current_scene == "earth":
			
				PlayerPos.earth_x = 69
				PlayerPos.earth_y = 76
				PlayerPos.current_scene = "rocket"
				TransitionScene.transition()
				TransitionScene.on_transition_finished
				await get_tree().create_timer(0.5).timeout
				get_tree().change_scene_to_file("res://Environments/rokcet_in_a_building.tscn")
				PlayerPos.earth_x = 234
				PlayerPos.earth_y = 78


func _on_detection_body_entered(body: Node2D) -> void:
	entered = true


func _on_detection_body_exited(body: Node2D) -> void:
	entered = false

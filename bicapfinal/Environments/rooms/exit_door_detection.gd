extends Node2D

var entered : bool = false

func _process(delta: float) -> void:
	if entered:
		if Input.is_action_pressed("interact"):
			if PlayerPos.current_scene == "service":
				TransitionScene.transition()
				TransitionScene.on_transition_finished
				await get_tree().create_timer(0.5).timeout
				get_tree().change_scene_to_file("res://Environments/earth.tscn")
				PlayerPos.service_center_x = 167
				PlayerPos.service_center_y = 70
				PlayerPos.current_scene = "earth"
				
				PlayerPos.isTransitioning = true
				PlayerPos.transitioning_scene()
		



func _on_body_entered(body: Node2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false

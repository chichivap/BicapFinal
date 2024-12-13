extends Area2D

var entered : bool = false

func _on_body_entered(body: Node2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false
	
func  _unhandled_input(event: InputEvent) -> void:
	if entered: 
		if event.is_action_pressed("interact"):
			if PlayerPos.task_1_passed:
				if PlayerPos.task_2_passed:
					if PlayerPos.task_3_passed:
						
						PlayerPos.current_scene = "Space"
						TransitionScene.transition()
						TransitionScene.on_transition_finished
						await get_tree().create_timer(0.5).timeout
						get_tree().change_scene_to_file("res://SPACE/space.tscn")
					else:
						pass
			

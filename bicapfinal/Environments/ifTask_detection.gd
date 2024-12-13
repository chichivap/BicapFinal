extends Node2D

const task : PackedScene = preload("res://Tasks/task_1.tscn")




var entered : bool = false

func _unhandled_input(event: InputEvent):
	
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.current_scene == "first_task_room":
				if !PlayerPos.task_1_passed:
					TransitionScene.transition()
					TransitionScene.on_transition_finished
					await get_tree().create_timer(0.5).timeout
					get_tree().change_scene_to_packed(task)
					
					

				else:
					TransitionScene.transition()
					TransitionScene.on_transition_finished
					await get_tree().create_timer(0.5).timeout
					get_tree().change_scene_to_file("res://Environments/rooms/service_center.tscn")
					PlayerPos.service_center_x = 71
					PlayerPos.service_center_y = 89
					PlayerPos.current_scene = "service"
				
					PlayerPos.isTransitioning = true
					PlayerPos.transitioning_scene()
					
					
		
				




func _on_body_entered(body: Node2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false

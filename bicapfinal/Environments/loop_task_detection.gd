extends Area2D

var entered : bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.current_scene == "second_task_room":
				if !PlayerPos.task_2_passed:
					
					get_tree().change_scene_to_file("res://Tasks/task_2.tscn")
					
					

				else:
					get_tree().change_scene_to_file("res://Environments/rooms/service_center.tscn")
					PlayerPos.service_center_x = 71
					PlayerPos.service_center_y = 121
					PlayerPos.current_scene = "service"
				
					PlayerPos.isTransitioning = true
					PlayerPos.transitioning_scene()


func _on_body_entered(body: Node2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = false

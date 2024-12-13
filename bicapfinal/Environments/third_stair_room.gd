
extends Node2D

var entered : bool = false

func _process(delta: float) -> void:
	if entered:		
		TransitionScene.transition()
		TransitionScene.on_transition_finished
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Environments/third_task.tscn")
		PlayerPos.service_center_x = 247
		PlayerPos.service_center_y = 89
		PlayerPos.current_scene = "third_task_room"
		


func _on_detection_area_body_entered(body: Node2D) -> void:
	entered= true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered= false

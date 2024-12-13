class_name Stairs
extends Node2D

var entered : bool = false

func _process(delta: float) -> void:
	if entered:		
		get_tree().change_scene_to_file("res://Environments/FirstTask.tscn")
		PlayerPos.service_center_x = 71
		PlayerPos.service_center_y = 88
		PlayerPos.current_scene = "first_task_room"
		


func _on_detection_area_body_entered(body: Node2D) -> void:
	entered= true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered= false

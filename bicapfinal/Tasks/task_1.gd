extends Control

var first : String
var second : String

@onready var result_label: Label = $ColorRect/ResultLabel

func _on_check_button_pressed() -> void:
	if (first.rstrip(" ") == "if") and (second.rstrip(" ") == "else"):
		result_label.text = "Правильно"
		PlayerPos.task_1_passed = true
	else:
		result_label.text = "Неправильно"
		


func _on_if_line_edit_text_changed(new_text: String) -> void:
	first = new_text


func _on_else_edit_text_changed(new_text: String) -> void:
	second = new_text


func _on_proceed_button_pressed() -> void:
	if PlayerPos.task_1_passed:
		get_tree().change_scene_to_file("res://Environments/rooms/service_center.tscn")
		PlayerPos.service_center_x = 71
		PlayerPos.service_center_y = 89
		PlayerPos.current_scene = "service"
				
		PlayerPos.isTransitioning = true
		PlayerPos.transitioning_scene()
		
	


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Environments/FirstTask.tscn")
	PlayerPos.current_scene = "first_task_room"
				
	PlayerPos.isTransitioning = true
	PlayerPos.transitioning_scene()
	

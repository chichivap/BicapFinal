extends Control

var first: String
var second: String
@onready var result_label: Label = $ColorRect2/ResultLabel


func _on_ten_line_edit_text_changed(new_text: String) -> void:
	first = new_text


func _on_while_line_edit_text_changed(new_text: String) -> void:
	second = new_text


func _on_check_button_pressed() -> void:
	if (first.rstrip(" ") == "10") and (second.rstrip(" ")=="while"):
		result_label.text = "Правильно"
		PlayerPos.task_2_passed = true
	else:
		result_label.text = "Неправильно"
		
		


func _on_proceed_button_pressed() -> void:
	if PlayerPos.task_2_passed:
		get_tree().change_scene_to_file("res://Environments/rooms/service_center.tscn")
		PlayerPos.service_center_x = 71
		PlayerPos.service_center_y = 121
		PlayerPos.current_scene = "service"
				
		PlayerPos.isTransitioning = true
		PlayerPos.transitioning_scene()


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Environments/second_task.tscn")
	PlayerPos.current_scene = "second_task_room"
				
	PlayerPos.isTransitioning = true
	PlayerPos.transitioning_scene()

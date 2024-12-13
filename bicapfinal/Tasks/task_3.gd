extends Control
var first : String
var second : String
var third : String 
@onready var result_label: Label = $ColorRect2/ResultLabel


func _on_bracket_1_line_edit_text_changed(new_text: String) -> void:
	first = new_text


func _on_bracket_2_line_edit_text_changed(new_text: String) -> void:
	second = new_text
	


func _on_array_line_edit_text_changed(new_text: String) -> void:
	third = new_text


func _on_check_button_pressed() -> void:
	if (first.rstrip(" ") == "[") and (second.rstrip(" ") == "]") and (third.rstrip(" ") == "systems"):
		result_label.text = "Правильно"
		PlayerPos.task_3_passed = true
	else:
		result_label.text = "Неправильно"
		



func _on_proceed_button_pressed() -> void:
	if PlayerPos.task_3_passed:
		get_tree().change_scene_to_file("res://Environments/rooms/service_center.tscn")
		PlayerPos.service_center_x = 247
		PlayerPos.service_center_y = 89
		PlayerPos.current_scene = "service"
				
		PlayerPos.isTransitioning = true
		PlayerPos.transitioning_scene()


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Environments/third_task.tscn")
	PlayerPos.current_scene = "third_task_room"
				
	PlayerPos.isTransitioning = true
	PlayerPos.transitioning_scene()

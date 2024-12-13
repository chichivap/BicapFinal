class_name MoveInputComponent


extends Node


@export var move_component: MoveComponent

func _input(event: InputEvent) -> void:
	var input_x = Input.get_axis("ui_left", "ui_right")
	move_component.velocity = Vector2(input_x * 100, 0)	
	

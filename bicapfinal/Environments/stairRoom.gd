class_name StairRoom
extends Node

var entered : bool = false

@export var next_scene: PackedScene



func _input(event: InputEvent) -> void:
	if entered:
		opened_door.emit(next_scene)	
			


func _on_detection_area_entered(area: Area2D) -> void:
	entered = true


func _on_detection_area_exited(area: Area2D) -> void:
	entered = false

signal opened_door(next_scene)

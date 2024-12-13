extends Node2D
@onready var stair_room: Stairs = $Stairs/StairRoom
@onready var player_character: CharacterBody2D = $PlayerCharacter


func _ready() -> void:
	player_character.global_position.x = PlayerPos.service_center_x
	player_character.global_position.y = PlayerPos.service_center_y

extends Node2D
@onready var player_character: CharacterBody2D = $PlayerCharacter

func _ready() -> void:
	player_character.global_position.x = PlayerPos.earth_x
	player_character.global_position.y = PlayerPos.earth_y

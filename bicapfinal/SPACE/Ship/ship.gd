extends Node2D
@onready var spawner_component: SpawnerComponent = $SpawnerComponent
@onready var scale_component: ScaleComponent = $ScaleComponent
@onready var fire_rate_timer: Timer = $FireRateTimer

@onready var move_component: MoveComponent = $MoveComponent
@onready var move_input_component: MoveInputComponent = $MoveInputComponent
@onready var animated_sprite_2d: AnimatedSprite2D = $Anchor/AnimatedSprite2D
@onready var flame_animated_sprite_2d: AnimatedSprite2D = $FlameAnimatedSprite2D
@onready var left_muzzle: Marker2D = $LeftMuzzle
@onready var right_muzzle: Marker2D = $RightMuzzle

func _process(delta: float) -> void:
	animate_the_ship()

func _ready() -> void:
	fire_rate_timer.timeout.connect(fire_lasers)
		
	
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("bank_left")
		flame_animated_sprite_2d.play("bank_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("bank_right")
		flame_animated_sprite_2d.play("bank_right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite_2d.play("center")
	
func fire_lasers() -> void:
	spawner_component.spawn(left_muzzle.global_position)
	spawner_component.spawn(right_muzzle.global_position)
	scale_component.tween_scale()
	$AudioStreamPlayer2D.play()

extends CharacterBody2D

@export var max_speed : int = 80

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed = 70

var current_dir = "none"

var friction : int = 400
var accel : int = 500

var input = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if PlayerPos.state == "MOVE":
		player_movement(delta)
		
	elif PlayerPos.state == "DIA":
		velocity = Vector2(0,0)
		animated_sprite_2d.play("IDLE")
	print(PlayerPos.current_scene)
	

		
	
	
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()
	
func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		player_anim(true)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		player_anim(true)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		player_anim(true)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		player_anim(true)
		velocity.x = 0
		velocity.y = -speed
	else:
		player_anim(false)
		velocity.x = 0
		velocity.y = 0
		
	
	move_and_slide()
	
func player_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == true:
			anim.play("side_walk") 
		elif movement == false:
			anim.play("Idle")
	if dir == "left":
		anim.flip_h = true
		if movement == true:
			anim.play("side_walk") 
		elif movement == false:
			anim.play("Idle")
	if dir == "down":
		anim.flip_h = false
		if movement == true:
			anim.play("front_walk") 
		elif movement == false:
			anim.play("Idle")
	if dir == "up":
		anim.flip_h = false
		if movement == true:
			anim.play("back_walk") 
		elif movement == false:
			anim.play("Idle")
	
	
	

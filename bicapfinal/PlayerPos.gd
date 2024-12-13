extends Node

@export var service_center_x:int = 167
@export var service_center_y:int = 67

@export var earth_x:int = 156
@export var earth_y:int = 133

@export var first_task_x:int
@export var first_task_y:int

var current_scene : String = "earth"

var isTransitioning :bool = false

func transitioning_scene():
	if isTransitioning:
		isTransitioning = false
	
	
var state = "MOVE"

@export var task_1_passed : bool = false
@export var task_2_passed : bool = false
@export var task_3_passed : bool = false

var score : int = 0

func calculate_score():
	if task_1_passed:
		if task_2_passed:
			if task_3_passed:
				score = 3
	

var mistake : bool = false

var game_is_finished = false

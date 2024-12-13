extends Node2D
@onready var first_question_timer: Timer = $FirstQuestionTimer
@onready var second_question_timer: Timer = $SecondQuestionTimer
@onready var third_question_timer: Timer = $ThirdQuestionTimer


@onready var label: Label = $Command2/Label

func _ready() -> void:
	PlayerPos.mistake = false
	first_question_timer.timeout.connect(first_label_show)
	second_question_timer.timeout.connect(second_label_show)
	third_question_timer.timeout.connect(third_label_show)
	
func _process(delta: float) -> void:
	if PlayerPos.mistake:
		label.text = "Попробуй еще раз"	
		TransitionScene.transition()
		TransitionScene.on_transition_finished
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://SPACE/space.tscn")
	if PlayerPos.game_is_finished:
		TransitionScene.transition()
		TransitionScene.on_transition_finished
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://UI/game_over.tscn")

func first_label_show():
	label.text = "if выполняет 
	код,если условие ложно"
	
func second_label_show():
	label.text = "break:пропускает текущую 
	итерацию 
	и переходит к следующей"
	
func third_label_show():
	label.text = "Удаление элементов из списка"
	
	

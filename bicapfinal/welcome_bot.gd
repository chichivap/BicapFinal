extends Node2D

var entered: bool = false

var first_time : bool = true

const lines: Array[String] = [
	"Привет, программист-астронавт! ",
	"Это уже вторая игра созданная командой  Team Guardians! Надеюсь вы знакомы первой игрой и уже знаете начальные азы программирования.",
	"А в этой игре  ты скоро попадешь на  борт космического корабля, и твоя цель — починить  ракету!",
	" Для этого тебе нужно решить серию задач на Python, чтобы проверить состояние всех систем ракеты. Каждое решение приближает тебя к запуску! ",
	"А сейчас может пройти в  космодром.",
]



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.state != "DIA":
			
				DialogueManager.start_dialog(global_position,lines)
					

func _on_detection_area_body_entered(body: Node2D) -> void:
	entered = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered = false

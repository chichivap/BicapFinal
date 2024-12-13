extends Node2D

var entered: bool = false

var first_time : bool = true

const first_lines: Array[String] = [
	"Увы, ты пока не можешь взлететь на ракете, она сейчас сломана.",
	"Однако, посетив сервисный центр и решив разные  задачи на Python ты сможешь ее починить и покорять вершины нашей вселенной ",
	"Но даже когда будешь в ракете не все так просто.",
	"Там тебе тоже нужно обойти трудности и остаться целым и невредимым.",
	"Будешь идти – ИДИ, если с испугу не свернешь. Только так побеждают!",
]
const lines: Array[String] = [
	"Удачи!"
]

const final_lines: Array[String] = [
	"Поздравляю! Ты починил ракету!",
	"Надеюсь это было не только увлекательное но и еще и полезное приключение.",
	"Полагаем что игра тебе понравилось и теперь ты можешь сесть на ракету и брать высоты космоса .",
	"Закончив последное и заключительное испытание на ракете  , у тебя появится возможность погонять на этой ракете и разбить метеоритов .",
	"Кстати я считаюсь рекордсменом, удастся ли тебе получить высокие очки?  А пока иди и заходите во внутрь ракеты."
]

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.state != "DIA":
				if first_time:
					DialogueManager.start_dialog(global_position, first_lines)
					first_time = false
				else:
					PlayerPos.calculate_score()
					if PlayerPos.score == 3:
						DialogueManager.start_dialog(global_position, final_lines)
					else:
						DialogueManager.start_dialog(global_position, lines)

func _on_detection_area_body_entered(body: Node2D) -> void:
	entered = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered = false

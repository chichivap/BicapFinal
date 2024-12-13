extends Node2D

var entered: bool = false

const lines: Array[String] = [
	"О Здарова!",
	"Как вижу ты из тех смельчаков которые готовы исправить поломки ракеты. ",
	"Но не забывай это не легко.",
	"Тебе нужно зайти здесь в три комнаты,изучить теоретический материал и пройти практический тест.Тогда  и у починишь ракету.",
]

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.state != "DIA":
				DialogueManager.start_dialog(global_position, lines)
			

func _on_detection_area_body_entered(body: Node2D) -> void:
	entered = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered = false

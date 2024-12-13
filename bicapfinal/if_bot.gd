extends Node2D

var entered: bool = false

const lines: Array[String] = [
	"Сейчас ты будешь изучать условия в Python.",
	"И так Условия позволяют выполнять код в зависимости от заданных условий.",
	"В Python используются конструкции if, elif и else",
	"If
	
	if выполняет код, если условие истинно.
	x = 10
	if x > 5:
	print('x больше чем 5') #Табуляция",
	
	"Else

	else выполняет код, если условие ложно.
		x = 3
	if x > 5:
		print('x больше 5') #Табуляция
	else:
		print('x не больше 5') #Табуляция
",
"Elif

elif проверяет дополнительные условия.
x = 10
if x < 5:
	print('x меньше 5') #Табуляция
elif x == 10:
	print('x равно 10') #Табуляция
else:
	print('x больше 5, но не равно 10') #Табуляция
"


]

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.state != "DIA":
				DialogueManager.start_dialog(global_position, lines	)
			

func _on_detection_area_body_entered(body: Node2D) -> void:
	entered = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered = false

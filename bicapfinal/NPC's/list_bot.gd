extends Node2D

var entered: bool = false

var first_time : bool = true

const lines: Array[String] = [
	"Список — это упорядоченная коллекция элементов. В Python списки могут содержать любые типы данных: числа, строки, другие списки и так далее.",
	"Пример создания списка:
		fruits = ['apple', 'banana', 'cherry']

",
"Чтобы добавить новый элемент в конец списка, используйте метод append():
fruits.append('orange')
print(fruits)  # ['apple', 'blueberry', 'cherry', 'orange']
",
"Чтобы удалить элемент из списка, можно использовать метод remove(), который удаляет первый встреченный элемент с указанным значением:
	fruits.remove('blueberry'')
print(fruits)  # ['apple', 'cherry', 'orange']


",
"Очень часто нужно выполнить действие с каждым элементом списка. Для этого используется цикл for. Например, чтобы вывести все элементы списка:
	for fruit in fruits:
	print(fruit) #Табуляция

",
]



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		if entered:
			if PlayerPos.state != "DIA":
				DialogueManager.start_dialog(global_position, lines)
					
				

func _on_detection_area_body_entered(body: Node2D) -> void:
	entered = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	entered = false

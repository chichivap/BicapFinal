extends Area2D

var entered :bool = false

func _on_body_entered(body: Node2D) -> void:
	entered = true


func _on_body_exited(body: Node2D) -> void:
	entered = true
	
func _process(delta: float) -> void:
	if entered:
		TransitionScene.transition()
		TransitionScene.on_transition_finished
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://Environments/earth.tscn")
		PlayerPos.current_scene = "earth"

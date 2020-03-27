extends Node
signal finished(next_state)
class_name State

func enter() -> void:
	pass

func update(next_state_name: String) -> void:
	emit_signal("finished", next_state_name)

func exit() -> void:
	pass

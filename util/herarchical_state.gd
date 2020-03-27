extends Node
signal finished(next_state)
class_name HerarchicalState

export(int) var PRIORITY: int = 0

func enter() -> void:
	pass

func update(next_state_name: String) -> void:
	emit_signal("finished", next_state_name)

func exit() -> void:
	pass

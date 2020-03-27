extends "res://util/state.gd"

class_name PlayerIdle

func handle_input() -> void:
	if PlayerInput.get_movement_input():
		self.update("PlayerMoving")

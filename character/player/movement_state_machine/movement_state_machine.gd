extends "res://util/stateMachine.gd"

class_name MovementStateMachine

func _physics_process(delta):
	self.current_state.handle_input()
	if self.current_state.has_method("move"):
		self.current_state.move(delta)

func set_active(value: bool) -> void:
	self._active = value
	self.set_physics_process(value)

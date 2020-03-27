extends "res://util/state.gd"
signal moved(velocity)
signal look_dir_updated(look_dir)
class_name PlayerMoving

export(float) var MAX_SPEED: float = 100.0
export(float) var ACCELERATION: float = 50.0
var move_dir: Vector2
var speed: float = 0.0

func enter() -> void:
	self.speed = 0.0

func handle_input() -> void:
	self.move_dir = PlayerInput.get_movement_input()
	self.emit_signal("look_dir_updated", self.move_dir)
	if not self.move_dir:
		self.update("PlayerIdle")


func move(delta: float) -> void:
	self.speed = UtilFunctions.calculate_speed_with_range(-self.MAX_SPEED,
	self.MAX_SPEED, self.speed, self.ACCELERATION, delta)
	self.emit_signal("moved", UtilFunctions.multiply_vector_by_scalar(
	self.speed, self.move_dir))

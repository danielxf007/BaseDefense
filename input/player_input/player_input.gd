extends "res://input/input.gd"

func get_movement_input() -> Vector2:
	return Vector2(int(Input.is_action_pressed("ui_right"))- int(
	Input.is_action_pressed("ui_left")), int(Input.is_action_pressed(
	"ui_down")) -int(Input.is_action_pressed("ui_up")))

func get_attack_input() -> bool:
	return Input.is_action_pressed("ui_accept")

extends Node

func mantain_in_range(lower_bound, upper_bound, number):
	if number <= lower_bound:
		return lower_bound
	if number >= upper_bound:
		return upper_bound
	return number

func calculate_speed(init_speed: float, accel: float,
 delta_time: float) -> float:
	return init_speed + accel*delta_time

func calculate_speed_with_range(lower_bound: float,
upper_bound: float, init_speed: float,
 accel: float, delta_time: float) -> float:
	var speed: float = self.calculate_speed(init_speed, accel, delta_time)
	return self.mantain_in_range(lower_bound, upper_bound, speed)

func add(accumulated, current_value):
	return accumulated + current_value

func substract(accumulated, current_value):
	return accumulated - current_value
	
func from_bool_to_int(boolean_val: bool) -> int:
	return int(boolean_val)

func add_vectors(vector1: Vector2, vector2: Vector2) -> Vector2:
	return vector1 + vector2

func multiply_vector_by_scalar(scalar, vector: Vector2) -> Vector2:
	return vector*scalar

func number_in_range(lower_bound, upper_bound, number) -> bool:
	return lower_bound <= number and number <= upper_bound

func delta(value_1, value_0):
	return value_1 - value_0

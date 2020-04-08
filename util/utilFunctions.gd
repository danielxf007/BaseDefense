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

func number_in_range(lower_bound, upper_bound, number) -> bool:
	return lower_bound <= number and number <= upper_bound

func is_inside_matrix(matrix_dim: Tuple, coord: Tuple) -> bool:
	return (self.number_in_range(0, matrix_dim.first_element-1,
	 coord.first_element) and self.number_in_range(0,
	 matrix_dim.second_element-1, coord.second_element))

func row_explosion(_range: Array, row_index: int,
matrix_of_cells: Array, board_dimensions: Tuple, allowed_cell: String) -> Array:
	var cell: Cell
	var row_explosion_range: Array = []
	var indexes: Tuple
	for j in _range:
		indexes = Tuple.new(row_index, j)
		if self.util_f.is_inside_matrix(board_dimensions, indexes):
			cell = matrix_of_cells[row_index][j]
			if cell.cell_type == allowed_cell:
				row_explosion_range.append(indexes)
				break
			else:
				row_explosion_range.append(indexes)
	return row_explosion_range

func column_explosion(_range: Array, column_index: int,
matrix_of_cells: Array, board_dimensions: Tuple, allowed_cell: String) -> Array:
	var cell: Cell
	var column_explosion_range: Array = []
	var indexes: Tuple
	for i in _range:
		indexes = Tuple.new(i, column_index)
		if self.util_f.is_inside_matrix(board_dimensions, indexes):
				cell = matrix_of_cells[i][column_index]
				if cell.cell_type == allowed_cell:
					column_explosion_range.append(indexes)
					break
				else:
					column_explosion_range.append(indexes)
	return column_explosion_range

extends "res://board/board.gd"

class_name GameBoard


func select_game_board_cell(cell_pos: Tuple) -> void:
	if not self.array[cell_pos.i][cell_pos.j].is_selected():
		self.array[cell_pos.i][cell_pos.j].select_cell()
	else:
		self.array[cell_pos.i][cell_pos.j].deselect_cell()


func get_selected_cells() -> Array:
	var selected_cells: Array = []
	for i in range(0, self.dimensions.i):
		for j in range(0, self.dimensions.j):
			if self.array[i][j].is_selected():
				selected_cells.append(self.array[i][j])
	return selected_cells

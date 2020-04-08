extends "res://board/board.gd"

class_name GameBoard


func select_game_board_cell(cell_pos: Tuple) -> void:
	if not self.array[cell_pos.i][cell_pos.j].is_selected():
		self.array[cell_pos.i][cell_pos.j].select_cell()
	else:
		self.array[cell_pos.i][cell_pos.j].deselect_cell()

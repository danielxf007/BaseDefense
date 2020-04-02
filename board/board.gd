extends "res://util/2_d_array.gd"
signal board_created(board)
class_name Board

export(String) var FILE: String
export(float) var CELL_X_DIM: float
export(float) var CELL_Y_DIM: float
export(Vector2) var BOARD_TOP_POS: Vector2
export(Dictionary) var TEXTURES: Dictionary
export(NodePath) var CELLS_NODE_PATH: NodePath
export(int) var NUMBER_OF_CELLS_COLUMNS: int
export(int) var NUMBER_OF_CELLS_ROWS: int
export(PackedScene) var CELL_SCENE: PackedScene
var cells_node: Node2D


func _ready():
	self.cells_node = self.get_node(self.CELLS_NODE_PATH)
	self.create_board(self.BOARD_TOP_POS, self.NUMBER_OF_CELLS_ROWS,
	self.NUMBER_OF_CELLS_COLUMNS, Tuple.new(self.CELL_X_DIM, self.CELL_Y_DIM),
	self.CELL_SCENE)
	var map: Array = self.get_map(self.FILE, " ")
	var map_size: Tuple = Tuple.new(map.size(), map[0].size())
	var args: Dictionary = {"start": Tuple.new(0, 0), "map_size": map_size,
	"map": map}
	self.organize_cells_texture(args)
	self.board_created()

func create_column_cells(starting_point: Vector2, n_cells: int,
 cell_dimensions: Tuple, cell_packed_scene: PackedScene) -> Array:
	var cell: Cell = cell_packed_scene.instance()
	self.cells_node.add_child(cell)
	cell.position = starting_point
	var cell_column: Array = [cell]
	var before_cell: Cell
	for j in range(1, n_cells):
			cell = cell_packed_scene.instance()
			self.cells_node.add_child(cell)
			before_cell = cell_column[j-1]
			cell.position.x = (before_cell.position.x +
			cell_dimensions.i)
			cell.position.y = before_cell.position.y
			cell_column.append(cell)
	return cell_column

func create_board(board_top_pos: Vector2, n_rows: int, n_columns: int,
cell_dimensions: Tuple, cell_scene: PackedScene) -> void:
	for _i in range(0, n_rows):
		self.add_column(self.create_column_cells(board_top_pos, n_columns,
		cell_dimensions, cell_scene))
		board_top_pos.y+= cell_dimensions.j

func get_map(file: String, element_separator: String) -> Array:
	var f = File.new()
	f.open(file, File.READ)
	var map: Array = []
	var column: Array = []
	while not f.eof_reached():
		var line = f.get_line()
		column = []
		for element in line:
			if not element == element_separator:
				column.append(element)
		map.append(column)
	f.close()
	map.pop_back()
	return map

func organize_cells_texture(args: Dictionary) -> void:
	for i in range(args["start"].i, args["map_size"].i):
		for j in range(args["start"].j, args["map_size"].j):
			self.array[i][j].texture = self.TEXTURES[args["map"][i][j]]

func board_created() -> void:
	for element in self.get_tree().get_nodes_in_group("board_listener"):
# warning-ignore:return_value_discarded
		self.connect("board_created", element, "_on_Board_board_created")
	self.emit_signal("board_created", self)

func add_column(_column: Array) -> void:
	self.array.append(_column)

func delete_element(_indexes: Tuple) -> void:
	self.array[_indexes.i].remove(_indexes)

func change_element(_indexes:Tuple, _element) -> void:
	self.array[_indexes.i][_indexes.j] = _element

func get_element(_indexes: Tuple):
	return self.array[_indexes.i][_indexes.j]

func get_column(_row_index) -> Array:
	return self.array[_row_index]

func set_cell_element(row_index: int, column_index: int, element) -> void:
	self.array[row_index][column_index] = element

extends Node

class_name TwoDArray

var dimensions: Tuple
var array: Array

func init(dim: Tuple, arr: Array):
	self.dimensions = dim
	self.array = arr

func get_dimensions() -> Tuple:
	return self.dimensions

func valid_indexes(_indexes: Tuple) -> bool:
	return false

func add_element(_row_index: int, _element) -> void:
	pass

func add_column(_row_index: int, _column: Array) -> void:
	pass

func delete_element(_indexes: Tuple) -> void:
	pass

func change_element(_indexes:Tuple, _element) -> void:
	pass

func has_element(_element) -> Tuple:
	return null

func get_element(_indexes: Tuple):
	pass

func get_column(_row_index) -> Array:
	return []

extends Sprite

class_name Cell

var element
var selected: bool = false
var selected_color: String
var deselected_color: String

func set_element(new_element) -> void:
	if not self.has_element():
		self.element = new_element

func has_element() -> bool:
	return self.element != null

func get_element():
	return self.element

func set_position_on_world(new_position: Vector2) -> void:
	self.global_position = new_position

func set_name(new_name: String) -> void:
	self.name = new_name

func select_cell() -> void:
	self.selected = true
	self.self_modulate = self.selected_color

func is_selected() -> bool:
	return self.selected

func deselect_cell() -> void:
	self.selected = false
	self.self_modulate =self.deselected_color

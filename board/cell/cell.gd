extends Sprite

class_name Cell

var element
var selected: bool = false
var selected_color: String

func init(textu: Texture, select_color: String) -> void:
	self.texture = textu
	self.selected_color = select_color

func set_element(new_element) -> void:
	if not self.has_element():
		self.element = new_element

func has_element() -> bool:
	return self.element != null

func get_element():
	return self.element

func set_position_on_world(new_position: Vector2) -> void:
	self.global_position = new_position

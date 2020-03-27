extends KinematicBody2D
signal look_direction_changed(direction)
class_name Player
const LOOK_DIREC_ANIMATIONS: Dictionary = {
Vector2(0, 0): "Idle", Vector2(0, 1): "South", Vector2(0, -1): "North",
Vector2(1, 0): "Side", Vector2(1, 1): "DiagDown", Vector2(1, -1): "DiagUp",
Vector2(-1, 0): "Side", Vector2(-1, 1): "DiagDown", Vector2(-1, -1): "DiagUp",
 }
var look_dir: Vector2 = Vector2(0, 0)

func _on_PlayerMoving_moved(velocity: Vector2) -> void:
# warning-ignore:return_value_discarded
	self.move_and_slide(velocity)


func _on_PlayerMoving_look_dir_updated(new_direction: Vector2) -> void:
	if new_direction and new_direction != self.look_dir:
		if new_direction.x > 0:
			$Sprite.flip_h = false
		elif new_direction.x < 0:
			$Sprite.flip_h = true
		self.look_dir = new_direction
		self.emit_signal("look_direction_changed",
		self.LOOK_DIREC_ANIMATIONS[self.look_dir])

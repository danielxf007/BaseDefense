extends Area2D

class_name Projectile

export(float) var VIEW_WIDTH: float
export(float) var VIEW_HEIGHT: float 
export(float) var MAX_SPEED: float 
export(float) var ACCELERATION: float
export(int) var DAMAGE: int
var speed: float
var move_dir: Vector2

func move(_delta: float) -> void:
	pass

func hit() -> void:
	pass

func is_out_side_view() -> bool:
	return false

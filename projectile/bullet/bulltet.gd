extends "res://projectile/projectile.gd"


class_name Bullet

var texture_dim: Vector2
var impacted: bool = false

func move(_delta: float) -> Vector2:
	self.speed += UtilFunctions.calculate_speed_with_range(0.0, self.MAX_SPEED,
	self.speed, self.ACCELERATION, _delta)
	return self.move_dir * self.speed * _delta 

func is_out_side_view() -> bool:
	return (UtilFunctions.number_in_range(0.0, 
	self.VIEW_WIDTH, self.global_position.x + self.texture_dim.x/2) or 
	UtilFunctions.number_in_range(0.0, self.VIEW_HEIGHT,
	self.global_position.y + self.texture_dim.y/2)) 

func _physics_process(delta):
	if not self.impacted:
		self.global_position += self.move(delta)
		if self.is_out_side_view():
			self.queue_free()

func _on_Bullet_body_entered(body):
	if body.has_method("hit"):
		body.hit(self.DAMAGE)
		self.queue_free()

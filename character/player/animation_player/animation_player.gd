extends AnimationPlayer


func play_animation(animation_name: String) -> void:
	if animation_name in self.get_animation_list():
		self.play(animation_name)

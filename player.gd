extends CharacterBody2D

const MAX_VEL := 90.0

func _process(delta: float):
	var gamma := 60.0 * delta
	var delta_lerp = gamma * 0.2
	
	if Input.is_key_pressed(KEY_D):
		self.velocity.x = lerp(self.velocity.x, MAX_VEL, delta_lerp)
	elif Input.is_key_pressed(KEY_A):
		self.velocity.x = lerp(self.velocity.x, -MAX_VEL, delta_lerp)
	else:
		self.velocity.x = 0
	
	if Input.is_key_pressed(KEY_S):
		self.velocity.y = lerp(self.velocity.y, MAX_VEL, delta_lerp)
	elif Input.is_key_pressed(KEY_W):
		self.velocity.y = lerp(self.velocity.y, -MAX_VEL, delta_lerp)
	else:
		self.velocity.y = 0
	
	move_and_slide()

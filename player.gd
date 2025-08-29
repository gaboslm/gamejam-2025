extends CharacterBody2D

func _process(delta: float):
	if Input.is_key_pressed(KEY_D):
		self.velocity.x = 10
	elif Input.is_key_pressed(KEY_A):
		self.velocity.x = -10
	else:
		self.velocity.x = 0
	
	if Input.is_key_pressed(KEY_W):
		self.velocity.x = 10
	elif Input.is_key_pressed(KEY_S):
		self.velocity.x = -10
	else:
		self.velocity.x = 0

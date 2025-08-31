extends Node2D

func _ready():
	for a: AnimatedSprite2D in get_children():
		a.play("default", 1.0, randi() % 2 == 0)

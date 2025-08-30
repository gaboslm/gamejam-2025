extends Area2D

var inspect_this := false

func _on_body_entered(body: Node2D) -> void:
	inspect_this = true

func _on_body_exited(body: Node2D) -> void:
	inspect_this = false

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_Z):
		$Inspected.inspected()

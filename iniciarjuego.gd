extends Button


func _on_pressed() -> void:
	$"../Panel".visible = true
	$"../Panel2".visible = true
	$"../Naraqstory1".visible = true
	$"../Naraqstory2".visible = true
	$"../Naraqstory3".visible = true
	$"../Naraqstory4".visible = true
	$"../Naraqstory5".visible = true
	var tween = create_tween()
	tween.tween_property($"../Panel", "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.5)
	tween.tween_interval(1)
	tween.tween_property($"../Naraqstory1", "modulate", Color(1.0, 1.0, 1.0, 1.0), 1)
	tween.tween_interval(3)
	tween.tween_property($"../Naraqstory2", "modulate", Color(1.0, 1.0, 1.0, 1.0), 1)
	tween.tween_interval(3)
	tween.tween_property($"../Naraqstory3", "modulate", Color(1.0, 1.0, 1.0, 1.0), 1)
	tween.tween_interval(5)
	tween.tween_property($"../Naraqstory4", "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.2)
	tween.tween_interval(5)
	tween.tween_property($"../Naraqstory5", "modulate", Color(1.0, 1.0, 1.0, 1.0), 0.2)
	tween.tween_interval(5)
	tween.tween_property($"../Panel2", "modulate", Color(1.0, 1.0, 1.0, 1.0),1)
	
	await tween.finished
	
	get_tree().change_scene_to_file("res://game.tscn")

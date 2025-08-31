extends Panel

var doing = false

func do():
	if doing:
		return
	doing = true
	visible = true
	var tw = create_tween()
	tw.tween_property(self, "modulate", Color(1,1,1,1), 1)
	await tw.finished
	
	get_tree().change_scene_to_file("res://dream.tscn")

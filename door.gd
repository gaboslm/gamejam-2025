extends Node

func inspected():
	if $"../../../Player".has_key:
		get_tree().change_scene_to_file("res://end.tscn")

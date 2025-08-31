extends Node

var times = 0

func inspected():
	times += 1
	if times >= 2:
		$"../../../Player".has_key = true
		$"../../../Label".visible = true

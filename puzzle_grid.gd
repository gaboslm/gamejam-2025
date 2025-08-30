@tool
extends Node2D

@export
var width := 0
@export
var height := 0

var prev := Vector2.ZERO

var grid := {}

func _process(delta: float) -> void:
	if !Engine.is_editor_hint():
		return
	var thing = preload("res://puzzle_tile.tscn")
	var newprev = Vector2(width, height)
	if newprev != prev:
		prev = newprev
		
		for x in width:
			for y in height:
				var name := "tile_" + str(x) + "_" + str(y)
				if get_node(name):
					continue
				var instance = thing.instantiate()
				instance.name = name
				instance.position.x = x * 17 * 3
				instance.position.y = y * 17 * 3
				add_child(instance)
				instance.owner = get_tree().edited_scene_root
				

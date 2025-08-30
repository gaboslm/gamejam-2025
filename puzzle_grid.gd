@tool
extends Node2D

@export
var width := 0
@export
var height := 0

var prev := Vector2.ZERO

var grid := {}

var is_inside := false
var solved := false
var starting_position := Vector2.ONE

func _process(delta: float) -> void:
	if !Engine.is_editor_hint():
		game(delta)
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
				
func game(delta: float) -> void:
	var player: CharacterBody2D = $"../Player"
	var in_y_bounds := player.position.y > position.y and player.position.y < position.y + height * 17 * 3
	var in_x_bounds := player.position.x > position.x and player.position.x < position.x + width * 17 * 3
	
	if !is_inside:
		starting_position = player.position
	
	if is_inside and !(in_x_bounds and in_y_bounds) and !solved:
		puzzle_check()
	elif is_inside and !solved:
		var player_pos = player.global_position - global_position
		var x = ((player_pos.x) as int / (17 * 3))
		var y = ((player_pos.y + 17 * 1.5) as int / (17 * 3))
		print(x, y)
		var name := "tile_" + str(x) + "_" + str(y)
		var node = get_node_or_null(name)
		if node:
			node.is_pressed = true
		
	
	is_inside = in_x_bounds and in_y_bounds
	

func puzzle_check():
	var player: CharacterBody2D = $"../Player"
	var failures = []
	for child: PuzzleTile in self.get_children():
		match child.symbol:
			PuzzleTile.SYMBOLS.Start:
				if !child.is_pressed:
					failures.append(child)
	
	if !failures.is_empty():
		player.position = starting_position
		for failure in failures:
			failure.flash()
		for child in self.get_children():
			child.is_pressed = false
	else:
		solved = true
		
	

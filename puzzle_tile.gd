@tool
extends Node2D

class_name PuzzleTile

enum SYMBOLS {
	None,
	BlackSquare,
	WhiteSquare,
	Wall,
	Start,
	End
}

var is_pressed := false
var force_coll := false

@export
var force_must_press := false

@export
var symbol := SYMBOLS.None

func _process(delta: float) -> void:
	if is_pressed:
		$Sprite.texture = preload("res://assets/puzzlepressed.png")
	else:
		$Sprite.texture = preload("res://assets/puzzletile.png")
	
	if force_must_press and Engine.is_editor_hint():
		self.modulate = Color.BLUE
	else:
		self.modulate = Color.WHITE
	
	$Symbol.visible = symbol != SYMBOLS.None
	$StaticBody2D/CollisionShape2D.disabled = symbol != SYMBOLS.Wall and symbol != SYMBOLS.WhiteSquare and symbol != SYMBOLS.BlackSquare and !force_coll
	match symbol:
		SYMBOLS.BlackSquare:
			$Symbol.texture = preload("res://assets/blacktile.png")
		SYMBOLS.WhiteSquare:
			$Symbol.texture = preload("res://assets/whitetile.png")
		SYMBOLS.Wall:
			$Symbol.texture = preload("res://assets/puzzleblocked.png")
		SYMBOLS.Start:
			$Symbol.texture = preload("res://assets/start.png")
		SYMBOLS.End:
			$Symbol.texture = preload("res://assets/end.png")


func flash():
	if force_must_press:
		return
	$AnimationPlayer.play("flash")
	if symbol == SYMBOLS.BlackSquare:
		$AnimationPlayer2.play("flash")
		

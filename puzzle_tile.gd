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

@export
var symbol := SYMBOLS.None

func _process(delta: float) -> void:
	if is_pressed:
		$Sprite.texture = preload("res://assets/puzzlepressed.png")
	else:
		$Sprite.texture = preload("res://assets/puzzletile.png")
	
	$Symbol.visible = symbol != SYMBOLS.None
	$StaticBody2D/CollisionShape2D.disabled = symbol != SYMBOLS.Wall
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
	$AnimationPlayer.play("flash")

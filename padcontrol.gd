extends Control

var symbols = []

func _process(delta: float) -> void:
	if symbols.size() > 0:
		$Display/Sym1.visible = true
		$Display/Sym1.texture = load("res://assets/sym" + str(symbols[0]) + ".png")
	else:
		$Display/Sym1.visible = false
	if symbols.size() > 1:
		$Display/Sym2.visible = true
		$Display/Sym2.texture = load("res://assets/sym" + str(symbols[1]) + ".png")
	else:
		$Display/Sym2.visible = false
	if symbols.size() > 2:
		$Display/Sym3.visible = true
		$Display/Sym3.texture = load("res://assets/sym" + str(symbols[2]) + ".png")
	else:
		$Display/Sym3.visible = false
	if symbols.size() > 3:
		$Display/Sym4.visible = true
		$Display/Sym4.texture = load("res://assets/sym" + str(symbols[3]) + ".png")
	else:
		$Display/Sym4.visible = false
		


func _on_1_pressed() -> void:
	symbols.append(1)
	checkmaybe()
func _on_2_pressed() -> void:
	symbols.append(2)
	checkmaybe()
func _on_3_pressed() -> void:
	symbols.append(3)
	checkmaybe()
func _on_4_pressed() -> void:
	symbols.append(4)
	checkmaybe()
func _on_5_pressed() -> void:
	symbols.append(5)
	checkmaybe()
func _on_6_pressed() -> void:
	symbols.append(6)
	checkmaybe()
func _on_7_pressed() -> void:
	symbols.append(7)
	checkmaybe()
func _on_8_pressed() -> void:
	symbols.append(8)
	checkmaybe()
func _on_9_pressed() -> void:
	symbols.append(9)
	checkmaybe()
	
func checkmaybe() -> void:
	if symbols.size() >= 4:
		if symbols == [1, 2, 2, 5]:
			$"../../Node2D2".visible = false
			$"../../lasers/CollisionShape2D2".disabled = true
		elif symbols == [3,1,4,3]:
			$"../../Node2D".visible = false
			$"../../lasers/CollisionShape2D".disabled = true
		self.visible = false
		symbols = []

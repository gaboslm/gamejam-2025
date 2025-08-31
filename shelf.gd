extends TextureRect

func _process(delta: float) -> void:
	var invis = [0,0,0,0]
	for child: TextureButton in $Row1.get_children():
		if !child.visible:
			invis[0] += 1
	for child: TextureButton in $Row2.get_children():
		if !child.visible:
			invis[1] += 1
	for child: TextureButton in $Row3.get_children():
		if !child.visible:
			invis[2] += 1
	for child: TextureButton in $Row4.get_children():
		if !child.visible:
			invis[3] += 1
	
	if invis == [1,2,2,5]:
		texture = preload("res://assets/shelf/bg_solved.png")

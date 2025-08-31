extends Panel

func _ready():
	var tw = create_tween()
	tw.tween_property(self, "modulate", Color(1,1,1,0), 1)
	tw.tween_property(self, "visible", false, 0)

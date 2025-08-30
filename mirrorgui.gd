extends TextureRect

var time_since_last_click := 0.0
var multi_clicks := 0

func _process(delta: float):
	time_since_last_click += delta
	
	if time_since_last_click >= 0.4:
		multi_clicks = 0

func _on_button_button_down() -> void:
	time_since_last_click = 0.0
	if time_since_last_click < 0.4:
		multi_clicks += 1
	
	if multi_clicks > 5:
		texture = preload("res://assets/brokenmirror.png")
		

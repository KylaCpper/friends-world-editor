extends SpinBox



func _ready() -> void:
	$check.connect("pressed",self,"on_pressed")
	editable = true
	
func on_pressed() -> void:
	if !$check.pressed:
		editable = false
	else:
		editable = true
	

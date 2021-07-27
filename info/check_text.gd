extends LineEdit



func _ready() -> void:
	$check.connect("pressed",self,"on_pressed")
	editable = true
	selecting_enabled = true
	
func on_pressed() -> void:
	if !$check.pressed:
		editable = false
		selecting_enabled = false
	else:
		editable = true
		selecting_enabled = true
		deselect()
	

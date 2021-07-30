extends SpinBox

signal _changed(num)

func _ready() -> void:
	$check.connect("pressed",self,"on_pressed")
	connect("value_changed",self,"on_changed")
	editable = true
	
	
func on_pressed() -> void:
	if !$check.pressed:
		editable = false
	else:
		editable = true
	
func on_changed(num:int) -> void:
	emit_signal("_changed",num)

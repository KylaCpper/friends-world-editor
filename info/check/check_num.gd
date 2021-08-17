extends SpinBox

signal _changed(num)
signal _switch(be)
func _ready() -> void:
	$check.connect("pressed",self,"on_pressed")
	connect("value_changed",self,"on_changed")
	editable = false
func switch(be:bool) -> void:
	if be:
		$check.pressed = true
		editable = true
	else:
		$check.pressed = false
		editable = false
	
func on_pressed() -> void:
	if !$check.pressed:
		editable = false
	else:
		editable = true
	emit_signal("_switch",$check.pressed)
func on_changed(num:int) -> void:
	emit_signal("_changed",num)

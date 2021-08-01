extends LineEdit

signal _changed(text_)

func _ready() -> void:
	$check.connect("pressed",self,"on_pressed")
	connect("text_changed",self,"on_changed")
	editable = false
	selecting_enabled = true
	
func on_pressed() -> void:
	if !$check.pressed:
		editable = false
		selecting_enabled = false
	else:
		editable = true
		selecting_enabled = true
		deselect()
	

func on_changed(text_:String) -> void:
	emit_signal("_changed",text_)

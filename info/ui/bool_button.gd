extends CheckBox

signal _changed(be)

func _ready() -> void:
	anchor_left = 0.5
	connect("toggled",self,"on_toggled")
	

func on_toggled(be:bool) -> void:
	emit_signal("_changed",be)

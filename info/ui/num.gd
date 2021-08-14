extends SpinBox

signal _changed(num)

func _ready() -> void:
	connect("value_changed",self,"on_changed")

func on_changed(num) -> void:
	hint_tooltip = str(num)
	emit_signal("_changed",num)

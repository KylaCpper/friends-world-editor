extends SpinBox

signal _changed(num)

func _ready() -> void:
	connect("value_changed",self,"on_changed")

func on_changed(num:int) -> void:
	emit_signal("_changed",num)

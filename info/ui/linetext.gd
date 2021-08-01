extends LineEdit


signal _changed(text_)

func _ready() -> void:
	connect("text_changed",self,"on_changed")
func on_changed(text_:String) -> void:
	emit_signal("_changed",text_)

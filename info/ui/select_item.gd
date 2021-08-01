extends LineEdit

signal _changed(text_)
func _ready() -> void:
	$Button.connect("pressed",self,"on_pressed")
	connect("text_changed",self,"on_changed")
func on_pressed() -> void:
	Overall.select_item_node._show("select_item","",self)

func on_changed(text_:String) -> void:
	emit_signal("_changed",text_)

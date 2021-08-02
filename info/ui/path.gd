extends Control

signal _changed(text)

func _ready() -> void:
	$Button.connect("pressed",self,"on_press")
	$LineEdit.connect("text_changed",self,"on_change")
func on_press() -> void:
	Overall.path_node._show("path",$LineEdit)

func on_change(text:String) -> void:
	$LineEdit.text = text
	emit_signal("_changed",text)

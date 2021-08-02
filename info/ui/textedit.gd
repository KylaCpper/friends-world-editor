extends Control

signal _changed(text_)

func _ready() -> void:
	$Button.connect("pressed",self,"on_pressed")
	$TextEdit.connect("text_changed",self,"on_changed")
func on_pressed() -> void:
	Overall.textedit_node._show("edit",$TextEdit.text,$TextEdit)

func on_changed() -> void:
	emit_signal("_changed",$TextEdit.text)

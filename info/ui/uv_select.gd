extends Control
var data :={}
var select := 0
signal _changed(text_)
func _ready() -> void:
	$Button.connect("pressed",self,"on_pressed")
	$LineEdit.connect("text_changed",self,"on_changed")
func on_pressed() -> void:
	if select == 0:
		Overall.uv_select_node._show(data,$LineEdit)
	else:
		Overall.uv_select_node._show_model(data,$LineEdit)
func on_changed(text_:String) -> void:
	$LineEdit.hint_tooltip = text_
	var d = str2var(text_)
	if typeof(d) != TYPE_DICTIONARY:return
	for key in d:
		data[key] = d[key]
	emit_signal("_changed",text_)

func _update(data:Dictionary) -> void:
	$LineEdit.text = var2str(data)
	$LineEdit.hint_tooltip = $LineEdit.text

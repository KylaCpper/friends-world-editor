extends LineEdit
var data :={}
signal _changed(text_)
func _ready() -> void:
	$Button.connect("pressed",self,"on_pressed")
	connect("text_changed",self,"on_changed")
func on_pressed() -> void:
	Overall.uv_select_node._show(data,self)

func on_changed(text_:String) -> void:
	hint_tooltip = text_
	var d = str2var(text_)
	if typeof(d) != TYPE_DICTIONARY:return
	for key in d:
		data[key] = d[key]
	emit_signal("_changed",text_)

extends LineEdit
var index := 0
signal _changed(text_)
func _ready() -> void:
	$Button.connect("pressed",self,"on_pressed")
	$delete.connect("pressed",self,"on_pressed1")
	connect("text_changed",self,"on_changed")
func on_pressed() -> void:
	Overall.select_item_node._show("select_item",text,self)

func on_changed(text_:String) -> void:
	hint_tooltip = text_
	emit_signal("_changed",text_)

func on_pressed1() ->void:
	$"../"._delete(index)
	queue_free()

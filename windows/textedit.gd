extends WindowDialog
var size := Vector2()
var obj

func _ready() ->void:
	Overall.textedit_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
func on_resized() -> void:
	size = rect_size
	$TextEdit.rect_size = rect_size
func _show(title:String,text:String,obj) -> void:
	self.obj = obj
	self.window_title = title
	$TextEdit.text = text
	popup()

func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
		obj.text = $TextEdit.text
		obj.emit_signal("text_changed")

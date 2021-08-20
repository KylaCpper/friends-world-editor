extends FileDialog

var size := Vector2()
var obj

signal _changed(text)
func _ready() ->void:
	Overall.path_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("file_selected",self,"on_hide")
	if Overall.path:
		current_dir = Overall.path
		
func on_resized() -> void:
	size = rect_size
	Overall.windows["path_node"]=[rect_size,rect_position]
	
func _show(title:String,obj) -> void:
#	self.filters = arr
	self.obj = obj
	if obj.text:
		current_path = Overall.path+obj.text
#	self.window_title = title
	popup()

func on_hide(path:String) -> void:
	if obj:
		obj.hint_tooltip = path
		var p=path.split(Overall.path, true, 1)
		if p.size() == 2:
			obj.emit_signal("text_changed",p[1])
		else:
			obj.emit_signal("text_changed",obj.text)

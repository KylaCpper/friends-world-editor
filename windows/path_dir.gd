extends FileDialog

var size := Vector2()
var obj
signal _changed(path)
func _ready() ->void:
	Overall.path_dir_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("dir_selected",self,"on_hide")
	if Overall.path:
		current_dir = Overall.path
func on_resized() -> void:
	size = rect_size
	Overall.windows["path_dir_node"]=[rect_size,rect_position]
func _show(title:String,obj) -> void:
#	self.filters = arr
	self.obj = obj
	self.window_title = title
	popup()

func on_hide(path:String) -> void:
	if obj:
		obj._changed_dir(path)

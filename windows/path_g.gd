extends FileDialog

var size := Vector2()
var obj
signal _changed(path)
func _ready() ->void:
	Overall.path_g_node = self
	connect("resized",self,"on_resized")
	connect("file_selected",self,"on_hide")
	if Overall.path:
		current_dir = Overall.path
func on_resized() -> void:
	size = rect_size
	
func _show(title:String,obj) -> void:
#	self.filters = arr
	self.obj = obj
	self.window_title = title
	popup()

func on_hide(path:String) -> void:
	if obj:
		obj._changed(path)

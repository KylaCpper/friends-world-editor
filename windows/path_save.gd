extends FileDialog

var size := Vector2()
var obj

signal _changed(text)

func _ready() ->void:
	Overall.path_save_node = self
	connect("resized",self,"on_resized")
	connect("file_selected",self,"on_hide")
func on_resized() -> void:
	size = rect_size
	
func _show(title:String,obj) -> void:
#	self.filters = arr
	self.obj = obj
	self.window_title = title
	popup()
	
func on_hide(path:String) -> void:
	Function.write_file(path,var2str(Overall.data),null)

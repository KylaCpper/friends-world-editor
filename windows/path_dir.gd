extends FileDialog

var size := Vector2()
var obj

signal _changed(text)

func _ready() ->void:
	Overall.path_dir_node = self
	connect("resized",self,"on_resized")
	connect("dir_selected",self,"on_hide")
func on_resized() -> void:
	size = rect_size
	
func _show(title:String,obj) -> void:
#	self.filters = arr
	self.obj = obj
	self.window_title = title
	popup()

func on_hide(path:String) -> void:
	if obj:
		var p=path.split(Overall.path, true, 1)
		if p.size() == 2:
			obj.emit_signal("text_changed",p[1])

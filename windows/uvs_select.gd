extends WindowDialog
var obj
var data :=[]

func _ready() ->void:
	Overall.uvs_select_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$ui0.connect("_changed",self,"on_changed")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,34)
	Overall.windows["uvs_select_node"]=[rect_size,rect_position]
func _show(title:String,data:Array,obj) -> void:
	self.obj = obj
#	self.window_title = title
	self.data = data
#	$ui0.data = data[0]
	$ui0.get_node("LineEdit").text = data[0]
	$ScrollContainer/uvs_select._update(data)
	popup()
func on_changed(path:String) -> void:
	if data[0] != path:
		data[0] = path
		Overall.block_node.update_block_tex()
func _show_model(title:String,data:Array,obj) -> void:
	self.obj = obj
#	self.window_title = title
	self.data = data
#	$ui0.data = data[0]
	$ui0.get_node("LineEdit").text = data[0]
	$ScrollContainer/uvs_select._update(data)
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
		obj.text=var2str(data)
		obj.emit_signal("text_changed")



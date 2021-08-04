extends WindowDialog
var obj
var data :=[]

func _ready() ->void:
	Overall.uvs_select_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,34)
func _show(title:String,data:Array,obj) -> void:
	self.obj = obj
	self.window_title = title
	self.data = data
	if data.size()<7:
		for i in range(7-data.size()):
			data.append({})
	$ui0.data = data[0]
	$ui0.text = var2str(data[0])
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



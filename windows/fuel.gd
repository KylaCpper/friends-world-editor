extends WindowDialog
var obj
var data :=[]
func _ready() ->void:
	Overall.fuel_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,12)
func _show(title:String,data:Array,obj) -> void:
	self.obj = obj
	self.window_title = title
	self.data = data
	$ScrollContainer/fuel._update(data)
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
		$ScrollContainer/fuel.set_data()
		obj.text=var2str(data)
		obj.emit_signal("text_changed")

extends WindowDialog
var obj
var data :=[]
func _ready() ->void:
	Overall.damage_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$add.connect("pressed",self,"on_pressed")
func on_pressed() -> void:
	data.append({"name":"","num":1,"pro":100,"stop":true})
	$ScrollContainer/damage._update(data)
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,34)
func _show(title:String,data:Array,obj) -> void:
	self.obj = obj
#	self.window_title = title
	self.data = data
	$ScrollContainer/damage._update(data)
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
#		$ScrollContainer/damage.set_data()
		obj.text=var2str(data)
		obj.emit_signal("text_changed")

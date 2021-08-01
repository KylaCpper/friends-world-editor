extends WindowDialog
var obj
var data :=""
var grid_tscn := preload("res://windows/component/select_item/select_item.tscn")
func _ready() ->void:
	Overall.select_item_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$ui0.connect("text_changed",self,"on_changed")
	$num.connect("value_changed",self,"on_numed")
func on_changed(text_:String) -> void:
	$ScrollContainer/select_item._update(text_)
func on_numed(num:int) -> void:
	$ScrollContainer/select_item.columns = num
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,32)
func _update() -> void:
	var datas = Overall.data
	var node = $ScrollContainer/select_item
	for c in node.get_children():
		c.queue_free()
	for key in datas:
		if key == "block":
			for keyy in datas[key]:
				var tscn = grid_tscn.instance()
				tscn.name = keyy
				tscn.name_ = keyy
				tscn.get_node("Label").text = keyy
				tscn.get_node("Label2").text = datas[key][keyy].name
				tscn.hint_tooltip = datas[key][keyy].name
				node.add_child(tscn)
func _show(title:String,data:String,obj) -> void:
	self.obj = obj
	self.window_title = title
	self.data = data
	$ScrollContainer/select_item._update(data)
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
		obj.text=data
		obj.emit_signal("text_changed",data)
	hide()



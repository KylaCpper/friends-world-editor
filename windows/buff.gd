extends WindowDialog
var data :=[]
func _ready() ->void:
	Overall.buff_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$add.connect("pressed",self,"on_pressed")
func get_buff_key(s:String,i:int) ->String:
	var ss = s+str(i)
	for d in data:
		if d.key == ss:
			return get_buff_key(s,i+1)
	return ss
func on_pressed() -> void:
	var s = get_buff_key("new_buff",0)
	data.append({"key":s,"tex":"","name":s,"info":"","name_en":"","info_en":"","deplete_time":0.0,"move":0.0,"absorb":0.0,"atk":0.0,"hand_speed":0.0,"sub_hp":0.0,"img":"","time":0.0,"nutrition_absorb":0.0,"nutrition_deplete_time":0.0})
	$ScrollContainer/buff._update(data)
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,34)
	Overall.windows["buff_node"]=[rect_size,rect_position]
func _show() -> void:
	data = Overall.buff
#	self.window_title = title
	$ScrollContainer/buff._update(data)
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
#	if obj:
##		$ScrollContainer/buff.set_data()
#		obj.text=var2str(data)
#		obj.emit_signal("text_changed")

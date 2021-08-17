extends WindowDialog
var obj
var data :=""
var grid_tscn := preload("res://windows/component/select_item/select_item.tscn")
var key := "block"
func _ready() ->void:
	Overall.select_item_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$ui0.connect("text_changed",self,"on_changed")
	$num.connect("value_changed",self,"on_numed")
	
	$block_btn.connect("pressed",self,"on_pressed",["block"])
	$item_btn.connect("pressed",self,"on_pressed",["item"])
	$tool_btn.connect("pressed",self,"on_pressed",["tool"])
	$armor_btn.connect("pressed",self,"on_pressed",["armor"])
	
	$update.connect("pressed",self,"on_update")
	
	$block.show()
	$item.hide()
	$tool.hide()
	$armor.hide()
func on_changed(text_:String) -> void:
	get_node(key+"/select_item")._update(text_)
func on_pressed(key:String) -> void:
	self.key = key
	$block.hide()
	$item.hide()
	$tool.hide()
	$armor.hide()
	get_node(key).show()
func on_numed(num:int) -> void:
	$block/select_item.columns = num
	$item/select_item.columns = num
	$tool/select_item.columns = num
	$armor/select_item.columns = num
func on_resized() -> void:
	$block.rect_size = rect_size - Vector2(22,32)
	$item.rect_size = rect_size - Vector2(22,32)
	$tool.rect_size = rect_size - Vector2(22,32)
	$armor.rect_size = rect_size - Vector2(22,32)
	Overall.windows["select_item_node"]=[rect_size,rect_position]
func _update() -> void:
	for key in ["block","item","tool","armor"]:
		var node = get_node(key+"/select_item")
		for c in node.get_children():
			c.free()
#	var datas = Overall.data
	for age in Overall.g_data:
		var datas = Overall.g_data[age]
		for key in ["block","item","tool","armor"]:
			var node = get_node(key+"/select_item")
	#		if key == "block":
	#			for keyy in datas[key]:
	#				var tscn = grid_tscn.instance()
	#				tscn.name = keyy
	#				tscn.name_ = keyy
	#				tscn.get_node("Label").text = keyy
	#				tscn.get_node("TextureRect").hide()
	#				var n = tscn.get_node("Sprite")
	#				n.show()
	#				if datas[key][keyy].material<=2:
	#					n.texture = Overall.block_img
	#				else:
	#					n.texture = Overall.block_img_model
	#				var vec2 = Vector2()
	#				if datas[key][keyy].uv.size() > 0:
	#					var be = datas[key][keyy].uv[0]
	#					if !be.empty():
	#						vec2 = Vector2(be.x,be.y)*16
	#				n.region_rect = Rect2(vec2,Vector2(16,16))
	#				n.scale = Vector2(2,2)
	##				tscn.get_node("TextureRect").texture = Overall.block_img
	#				tscn.hint_tooltip = keyy
	#				node.add_child(tscn)
			if key == "item" || key == "tool" || key == "armor" || key == "block":
				for keyy in datas[key]:
					var tscn = grid_tscn.instance()
					tscn.name = keyy
					tscn.name_ = keyy
					tscn.get_node("Label").text = keyy
					tscn.get_node("Sprite").hide()
					var n = tscn.get_node("TextureRect")
					n.show()
					n.texture = datas[key][keyy].tex
					tscn.hint_tooltip = keyy
					node.add_child(tscn)
func _show(title:String,data:String,obj) -> void:
	self.obj = obj
#	self.window_title = title
	self.data = data
	if Overall.item_c:
		_update()
		Overall.item_c = false
	get_node(key+"/select_item")._update("")
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

func on_update() -> void:
	_update()

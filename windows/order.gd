extends WindowDialog
var obj

var grid_tscn = load("res://windows/component/order/order_block.tscn")
func _ready() ->void:
	Overall.order_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$ui0.connect("text_changed",self,"on_changed")
	$num.connect("value_changed",self,"on_numed")
	$update.connect("pressed",self,"on_update")
	
func on_changed(text_:String) -> void:
	$scroll/order._update(text_)

func on_numed(num:int) -> void:
	$scroll/order.columns = num
func on_resized() -> void:
	$scroll.rect_size = rect_size - Vector2(22,32)
func _update() -> void:
	for age in Overall.g_data:
		var datas = Overall.g_data[age]
		var node = $scroll/order
		for c in node.get_children():
			c.free()

		for i in Overall.order:
			var key = Overall.order[i]
			var tscn = grid_tscn.instance()
			tscn.name = key
			tscn.name_ = key
			tscn.get_node("Label").text = key
			tscn.get_node("TextureRect").show()
			tscn.get_node("Sprite").hide()
			if datas.block[key].img:
				tscn.get_node("TextureRect").texture = datas.block[key].tex
#			var n = tscn.get_node("Sprite")
#			if datas.block[key].material<=2:
#				n.texture = Overall.block_img
#			else:
#				n.texture = Overall.block_img_model
#			n.show()
#			if datas.block[key].material<=2:
#				n.texture = Overall.block_img
#			else:
#				n.texture = Overall.block_img_model
#			var vec2 = Vector2()
#			if datas.block[key].uv.size() > 0:
#				var be = datas.block[key].uv[0]
#				if !be.empty():
#					vec2 = Vector2(be.x,be.y)*16
#			n.region_rect = Rect2(vec2,Vector2(16,16))
#			n.scale = Vector2(2,2)
	#				tscn.get_node("TextureRect").texture = Overall.block_img
			tscn.index = i
			tscn.hint_tooltip = key
			node.add_child(tscn)
		var i = Overall.order.size()
		for key in datas.block:
			if key in Overall.order_key:
				continue
			else:
				Overall.order[i] = key
				Overall.order_key[key] = i
				
			var tscn = grid_tscn.instance()
			tscn.name = key
			tscn.name_ = key
			tscn.get_node("Label").text = key
			tscn.get_node("TextureRect").show()
			tscn.get_node("Sprite").hide()
			if datas.blocks[key].img:
				tscn.get_node("TextureRect").texture = datas.blocks[key].tex
#			var n = tscn.get_node("Sprite")
#			n.show()
#			if datas.block[key].material<=2:
#				n.texture = Overall.block_img
#			else:
#				n.texture = Overall.block_img_model
#			var vec2 = Vector2()
#			if datas.block[key].uv.size() > 0:
#				var be = datas.block[key].uv[0]
#				if !be.empty():
#					vec2 = Vector2(be.x,be.y)*16
#			n.region_rect = Rect2(vec2,Vector2(16,16))
#			n.scale = Vector2(2,2)
#	#				tscn.get_node("TextureRect").texture = Overall.block_img
			tscn.hint_tooltip = key
			tscn.index = i
			node.add_child(tscn)
			i =i+1
		for key in datas.liquid_block:
			if key in Overall.order_key:
				continue
			else:
				Overall.order[i] = key
				Overall.order_key[key] = i
				
			var tscn = grid_tscn.instance()
			tscn.name = key
			tscn.name_ = key
			tscn.get_node("Label").text = key
			tscn.get_node("TextureRect").hide()
			tscn.get_node("Sprite").hide()
			tscn.hint_tooltip = key
			tscn.index = i
			node.add_child(tscn)
			i =i+1
func _show() -> void:
#	self.window_title = title
#	$scroll/order._update(data)
	_update()
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	hide()

func on_update() -> void:
	_update()

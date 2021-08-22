extends WindowDialog
var obj

var grid_tscn = load("res://windows/component/order/order_block.tscn")
func _ready() ->void:
	Overall.order_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
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
	Overall.windows["order_node"]=[rect_size,rect_position]
func _update() -> void:
	var node = $scroll/order
	var delete_arr := []
	for i in Overall.order:
		var be := true
		for age in Overall.g_data:
			var datas = Overall.g_data[age]
			var key = Overall.order[i]
			if key in datas.block:
				be = false
				break
			else:
				if key in datas.liquid_block:
					be = false
					break
		if be:
			delete_arr.append(i)
	for key in delete_arr:
		Overall.order_key.erase(Overall.order[key])
		Overall.order.erase(key)
#		print(key)
	for c in node.get_children():
		c.free()
#	for age in Overall.g_data:
#		var datas = Overall.g_data[age]
#		print(age)
	var index := 0
	for i in Overall.order:
		for age in Overall.g_data:
			var key = Overall.order[i]
			var datas = Overall.g_data[age]
			if key in datas.block:
				var tscn = grid_tscn.instance()
				tscn.name = key
				tscn.name_ = key
				tscn.get_node("Label").text = key
				var texture = tscn.get_node("TextureRect")
				texture.show()
				
				if "img" in datas.block[key]:
					if datas.block[key].img:
						texture.texture = datas.block[key].tex
				tscn.index = i
				tscn.hint_tooltip = key
				node.add_child(tscn)
				index = i+1
				break
			else:
				if key in datas.liquid_block:
					var tscn = grid_tscn.instance()
					tscn.name = key
					tscn.name_ = key
					tscn.get_node("Label").text = key
					var texture = tscn.get_node("TextureRect")
					texture.hide()
					tscn.index = i
					tscn.hint_tooltip = key
					node.add_child(tscn)
					index = i+1
					break
	for age in Overall.g_data:
		var datas = Overall.g_data[age]
		
		for key in datas.block:
			if key in Overall.order_key:
				continue
			else:
				Overall.order[index] = key
				Overall.order_key[key] = index
				
			var tscn = grid_tscn.instance()
			tscn.name = key
			tscn.name_ = key
			tscn.get_node("Label").text = key
			var texture = tscn.get_node("TextureRect")
			texture.show()
			if datas.block[key].img:
				texture.texture = datas.block[key].tex
			tscn.hint_tooltip = key
			tscn.index = index
			node.add_child(tscn)
			index =index+1
		for key in datas.liquid_block:
			if key in Overall.order_key:
				continue
			else:
				Overall.order[index] = key
				Overall.order_key[key] = index
				
			var tscn = grid_tscn.instance()
			tscn.name = key
			tscn.name_ = key
			tscn.get_node("Label").text = key
			tscn.get_node("TextureRect").hide()
			tscn.hint_tooltip = key
			tscn.index = index
			node.add_child(tscn)
			index =index+1
func _show() -> void:
#	self.window_title = title
#	$scroll/order._update(data)
	if Overall.order_c:
		_update()
		Overall.order_c = false
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	hide()

func on_update() -> void:
	_update()

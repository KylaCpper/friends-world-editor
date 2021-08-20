extends Panel

var key = ""
var class_key = -1
var type := "item"#class
var c_data
func _ready() -> void:
	Overall.msg_node = self
	$button0.connect("pressed",self,"on_pressed0")
	$button1.connect("pressed",self,"on_pressed1")
	$button2.connect("pressed",self,"on_pressed2")
	$button3.connect("pressed",self,"on_pressed3")
	$button4.connect("pressed",self,"on_pressed4")
#	$button5.connect("pressed",self,"on_pressed5")
	$button6.connect("pressed",self,"on_pressed6")
	$button7.connect("pressed",self,"on_pressed7")
	$button8.connect("pressed",self,"on_pressed8")
	
func _show(key:String) -> void:
	self.key = key
	if key:
		$button6.show()
		if rect_position.y > 450:
			rect_position.y = 450
		rect_size.y = 150
	else:
		$button6.hide()
		if rect_position.y > 470:
			rect_position.y = 470
		rect_size.y = 130
	type = "item"
	show()
func _show_int(key:int) -> void:
	if rect_position.y > 450:
		rect_position.y = 450
	self.class_key = key
	$button6.show()
	rect_size.y = 150
	type = "class"
	show()
func new_data(type:String,name_:String,node,copy_data=null) -> void:
	if !Overall.head_node.open_project:
		Overall.msg_warn_node._show("错误","需要新建项目")
		return
	if !"age" in Overall.data:
		Overall.msg_warn_node._show("错误","无选择分类")
		return
	var key = Overall.next_key_list(name_)
	Overall.key_list[key]=1
	Overall.data[type][key]={"key":key}
	if !copy_data:
		node.set_data(Overall.data[type][key])
		Overall.data[type][key]["g"] = class_key
	else:
		Overall.data[type][key] = copy_data.duplicate(true)
		Overall.data[type][key].key = key
		node.data = Overall.data
		
	Overall.left_node._update()
	Overall.order_node._update()
#	Overall.select_item_node._update()
	hide()
#添加当前组
func on_pressed0() -> void:
	if class_key > -1:
		var g = Overall.data.age.group[class_key]
		var type = Overall.type_list[g[1]]
		var O = Overall
		new_data(type,"new_"+type,O[type+"_node"])
#修改
func on_pressed1() -> void:
	if class_key > -1:
		Overall.set_class_s_node._show(class_key)
#	new_data("liquid_block","new_liquid_block",Overall.liquid_block_node)
func  on_pressed2() -> void:
	if key:
		if Overall.block_node.visible:
			new_data("block",key,Overall.block_node,Overall.data.block[key])
		if Overall.liquid_block_node.visible:
			new_data("liquid_block",key,Overall.liquid_block_node,Overall.data.liquid_block[key])
		if Overall.item_node.visible:
			new_data("item",key,Overall.item_node,Overall.data.item[key])
		if Overall.tool_node.visible:
			new_data("tool",key,Overall.tool_node,Overall.data["tool"][key])
		if Overall.armor_node.visible:
			new_data("armor",key,Overall.armor_node,Overall.data.armor[key])
	else:
		Overall.msg_warn_node._show("错误","无法找到副本")
#ctrl c
func on_pressed3() -> void:
	if key:
		if Overall.block_node.visible:
			c_data = Overall.data.block[key].duplicate(true)
		if Overall.liquid_block_node.visible:
			c_data = Overall.data.liquid_block[key].duplicate(true)
		if Overall.item_node.visible:
			c_data = Overall.data.item[key].duplicate(true)
		if Overall.tool_node.visible:
			c_data = Overall.data["tool"][key].duplicate(true)
		if Overall.armor_node.visible:
			c_data = Overall.data.armor[key].duplicate(true)
	
#ctrl v
func on_pressed4() -> void:
	if c_data && class_key > -1:
		var type = Overall.type_list[Overall.data.age.group[class_key][1]]
		if c_data["class"] == type:
			new_data(type,c_data.key,Overall.block_node,c_data)
		else:
			Overall.msg_warn_node._show("错误","类型不匹配")
#		if Overall.liquid_block_node.visible:
#			print(c_data)
#			if c_data["class"] == "liquid_block":
#				new_data("liquid_block",c_data.key,Overall.liquid_block_node,c_data)
#				success = true
#		if Overall.item_node.visible:
#			if c_data["class"] == "item":
#				new_data("item",c_data.key.Overall.item_node,c_data)
#				success = true
#		if Overall.tool_node.visible:
#			if c_data["class"] == "tool":
#				new_data("tool",c_data.key,Overall.tool_node,c_data)
#				success = true
#		if Overall.armor_node.visible:
#			if c_data["class"] == "armor":
#				new_data("armor",c_data.key,Overall.armor_node,c_data)
#				success = true
func on_pressed5() -> void:
	new_data("armor","new_armor",Overall.armor_node)
func on_pressed6() -> void:
	Overall.sure_window_node._show("",self)

var block_info_tscn := preload("res://info/block_info/block_info.tscn")
func on_pressed7() -> void:
	Overall.add_class_s_node._show()

func on_sure() -> void:
	if type == "item":
		if key:
			if Overall.block_node.visible:
				Overall.data.block.erase(key)
			if Overall.liquid_block_node.visible:
				Overall.data.liquid_block.erase(key)
			if Overall.item_node.visible:
				Overall.data.item.erase(key)
			if Overall.tool_node.visible:
				Overall.data["tool"].erase(key)
			if Overall.armor_node.visible:
				Overall.data.armor.erase(key)
			Overall.key_list.erase(key)
			Overall.clear_order(key)
			Overall.left_node._update()
			Overall._hide()
	if type == "class":
		if class_key > -1:
			var type = Overall.type_list[Overall.data.age.group[class_key][1]]
			Overall.data.age.group.remove(class_key)
			var d = Overall.data[type]
			var deletes := []
			for k in d:
				if d[k].g > class_key:
					d[k].g = d[k].g -1
				else:
					if d[k].g == class_key:
						deletes.append(k)
			for k in deletes:
				d.erase(k)
				Overall.key_list.erase(k)
			Overall.order_node._update()
			Overall.left_node._update()
func on_pressed8() -> void:
	Overall.left_node._update()
func _input(event) ->void:
	if event.is_action_pressed("mouse_left"):
		yield(get_tree(),"idle_frame")
		hide()
	if event.is_action_pressed("ctrl+d"):
		yield(get_tree(),"idle_frame")
		hide()
		on_pressed2()
	if event.is_action_pressed("ctrl+c"):
		on_pressed3()
	if event.is_action_pressed("ctrl+v"):
		on_pressed4()

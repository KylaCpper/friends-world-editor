extends Tree

onready var data = Overall.data
var root:TreeItem
#var block:TreeItem
#var liquid_block:TreeItem
#var plant_block:TreeItem
#var item:TreeItem
#var tool_:TreeItem
#var armor:TreeItem
var block_img :=preload("res://assets/img/type1.png")
var liquid_img :=preload("res://assets/img/type2.png")
var item_img :=preload("res://assets/img/type3.png")
var tool_img :=preload("res://assets/img/type4.png")
var armor_img :=preload("res://assets/img/type5.png")
var class_list := [block_img,liquid_img,item_img,tool_img,armor_img]
var group := []
func _ready():
	Overall.left_node = self
	
	_update()

	connect("item_selected",self,"on_select")
	connect("item_rmb_selected",self,"on_select_rmb")
func _change(nkey,ntool) -> void:
	var obj = get_selected()
	obj.set_text(0,nkey)
	obj.set_tooltip(0,ntool)
func _update() -> void:
	data = Overall.data
	clear()
	root = create_item(self)
	root.set_text(0, "root")
	
#	block = create_item(root)
#	block.set_text(0, "block")
#	block.set_icon(0, block_img)
#	block.set_tooltip(0, "block")
#
#	liquid_block = create_item(root)
#	liquid_block.set_text(0, "liquid_block")
#	liquid_block.set_icon(0, liquid_img)
#	liquid_block.set_tooltip(0, "liquid_block")
##	plant_block = create_item(root)
##	plant_block.set_text(0, "plant_block")
#
#	item = create_item(root)
#	item.set_text(0, "item")
#	item.set_icon(0, item_img)
#	item.set_tooltip(0, "item")
#
#	tool_ = create_item(root)
#	tool_.set_text(0, "tool")
#	tool_.set_icon(0, tool_img)
#	tool_.set_tooltip(0, "tool")
#
#	armor = create_item(root)
#	armor.set_text(0, "armor")
#	armor.set_icon(0, armor_img)
#	armor.set_tooltip(0, "armor")
#	group = [block,liquid_block,item,tool_,armor]
	group = []
	for i in range(data.age.group.size()):
		var g = create_item(root)
		g.set_text(0, data.age.group[i][0])
		if data.age.group[i][3]:
			g.set_icon(0, data.age.group[i][3])
		else:
			if i <= 4:
				g.set_icon(0, class_list[i])
		g.set_tooltip(0, data.age.group[i][0])
		group.append(g)
	for key in data.block:
		var d = data.block[key]
		if !"g" in d:
			d.g = 0
		var be = create_item(group[d.g])
		be.set_text(0,key)
		if d.tex:
			be.set_icon(0,d.tex)
		be.set_tooltip(0,d.name)
	for key in data.liquid_block:
		var d = data.liquid_block[key]
		if !"g" in d:
			d.g = 1
		var be = create_item(group[d.g])
		be.set_text(0,key)
		be.set_tooltip(0,d.name)
#	for key in data.plant_block:
#		var be = create_item(plant_block)
#		be.set_text(0,key)
#		be.set_tooltip(0,data.plant_block[key].name)
	for key in data.item:
		var d = data.item[key]
		if !"g" in d:
			d.g = 2
		var be = create_item(group[d.g])
		be.set_text(0,key)
		if d.tex:
			be.set_icon(0,d.tex)
		be.set_tooltip(0,d.name)
	for key in data["tool"]:
		var d = data["tool"][key]
		if !"g" in d:
			d.g = 3
		var be = create_item(group[d.g])
		be.set_text(0,key)
		if data["tool"][key].tex:
			be.set_icon(0,d.tex)
		be.set_tooltip(0,d.name)
	for key in data.armor:
		var d = data.armor[key]
		if !"g" in d:
			d.g = 4
		var be = create_item(group[d.g])
		be.set_text(0,key)
		if data.armor[key].tex:
			be.set_icon(0,d.tex)
		be.set_tooltip(0,d.name)


func on_select() -> void:
	data = Overall.data
	var key = get_selected().get_text(0)
	var parent_name = get_selected().get_parent().get_text(0)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	var be := false
	if parent_name != "root":
		Overall._hide()
		for d in Overall.data.age.group:
			if parent_name == d[0]:
				var type = Overall.type_list[d[1]]
				var O = Overall
				O[type+"_node"]._update(data[type][key])
				be = true
				break 
				
	if be == true:
		$"../info".key = key
		Overall.msg_node.key = key
		Overall.msg_node.type = "item"
	else:
		Overall.msg_node.key = ""
func on_select_rmb(vec2:Vector2) -> void:
	var key = get_selected().get_text(0)
#	var index = get_selected().get_tooltip(0)
	var parent_name = get_selected().get_parent().get_text(0)
	Overall.msg_node.rect_position = vec2+Vector2(0,100)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	var be := false
	
	if parent_name != "root":
		for d in Overall.data.age.group:
			if parent_name == d[0]:
				var type = Overall.type_list[d[1]]
				if key in data[type]:
#					Overall.msg_node.class_key = parent_name
					var i := 0
					for dd in Overall.data.age.group:
						if parent_name == dd[0]:
							Overall.msg_node.class_key = i
							break
						i = i+1
					be = true
					break 
	else:
		var i := 0
		for d in Overall.data.age.group:
			if key == d[0]:
				Overall.msg_node._show_int(i)
				return
			i = i+1

	if be == true:
		$"../info".key = key
		Overall.msg_node._show(key)
	else:
		Overall.msg_node._show("")

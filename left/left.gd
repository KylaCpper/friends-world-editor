extends Tree

onready var data = Overall.data
var root:TreeItem
var block:TreeItem
var liquid_block:TreeItem
var plant_block:TreeItem
var item:TreeItem
var tool_:TreeItem
var armor:TreeItem
func _ready():
	Overall.left_node = self
	
	_update()

	connect("item_selected",self,"on_select")
	connect("item_rmb_selected",self,"on_select_rmb")
func _update() -> void:
	clear()
	root = create_item(self)
	root.set_text(0, "root")
	
	block = create_item(root)
	block.set_text(0, "block")
	liquid_block = create_item(root)
	liquid_block.set_text(0, "liquid_block")
	
	plant_block = create_item(root)
	plant_block.set_text(0, "plant_block")

	item = create_item(root)
	item.set_text(0, "item")
	
	
	tool_ = create_item(root)
	tool_.set_text(0, "tool")
	
	armor = create_item(root)
	armor.set_text(0, "armor")
	for key in data.block:
		var be = create_item(block)
		be.set_text(0,key)
		be.set_tooltip(0,data.block[key].name)
	for key in data.liquid_block:
		var be = create_item(liquid_block)
		be.set_text(0,key)
		be.set_tooltip(0,data.liquid_block[key].name)
	for key in data.plant_block:
		var be = create_item(plant_block)
		be.set_text(0,key)
		be.set_tooltip(0,data.plant_block[key].name)
	for key in data.item:
		var be = create_item(item)
		be.set_text(0,key)
		be.set_tooltip(0,data.item[key].name)
	for key in data["tool"]:
		var be = create_item(tool_)
		be.set_text(0,key)
		be.set_tooltip(0,data["tool"][key].name)
	for key in data.armor:
		var be = create_item(armor)
		be.set_text(0,key)
		be.set_tooltip(0,data.armor[key].name)
	
func on_select() -> void:
	var key = get_selected().get_text(0)
	var parent_name = get_selected().get_parent().get_text(0)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if parent_name != "root":
		Overall._hide()
		if parent_name == "block":
			Overall.block_node._update(data.block[key])
		if parent_name == "liquid_block":
			Overall.liquid_block_node._update(data.liquid_block[key])
		if parent_name == "plant_block":
			Overall.plant_block_node._update(data.plant_block[key])
func on_select_rmb(vec2:Vector2) -> void:
	var key = get_selected().get_text(0)
	Overall.msg_node.rect_position = vec2+Vector2(0,60)
	Overall.msg_node.show()
func _show() -> void:
	Overall._hide()
	Overall.block_node.data = Overall.data.block
	Overall.block_node._update()

extends Control
var key := ""
func _input(event) -> void:
	if event.is_action_pressed("delete"):
		Overall.sure_window_node._show("",self)
func on_sure() -> void:
	if key:
		Overall.key_list.erase(key)
		Overall.clear_order(key)
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
		Overall.left_node._update()
		Overall._hide()

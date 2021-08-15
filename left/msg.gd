extends Panel
var key = ""
func _ready() -> void:
	Overall.msg_node = self
	$button0.connect("pressed",self,"on_pressed0")
	$button1.connect("pressed",self,"on_pressed1")
#	$button2.connect("pressed",self,"on_pressed2")
	$button3.connect("pressed",self,"on_pressed3")
	$button4.connect("pressed",self,"on_pressed4")
	$button5.connect("pressed",self,"on_pressed5")
	$button6.connect("pressed",self,"on_pressed6")

	$button8.connect("pressed",self,"on_pressed8")
	
func _show(key:String) -> void:
	self.key = key
	if key:
		$button6.show()
		rect_size.y = 150
	else:
		$button6.hide()
		rect_size.y = 129
	show()
func new_data(type:String,node) -> void:
	if !Overall.head_node.open_project:
		Overall.msg_warn_node._show("错误","需要新建项目")
		return
	if !"age" in Overall.data:
		Overall.msg_warn_node._show("错误","无选择分类")
		return
	var key = Overall.next_key_list("new_"+type,0)
	Overall.key_list[key]=1
	Overall.data[type][key]={"key":key}
	node.set_data(Overall.data[type][key])
	Overall.left_node._update()
	Overall.select_item_node._update()
	hide()
func on_pressed0() -> void:
	new_data("block",Overall.block_node)
	
func on_pressed1() -> void:
	new_data("liquid_block",Overall.liquid_block_node)
func  on_pressed2() -> void:
	new_data("plant_block",Overall.plant_block_node)
func on_pressed3() -> void:
	new_data("item",Overall.item_node)
func on_pressed4() -> void:
	new_data("tool",Overall.tool_node)
func on_pressed5() -> void:
	new_data("armor",Overall.armor_node)
func on_pressed6() -> void:
	Overall.sure_window_node._show("",self)
func on_sure() -> void:
	if key:
		Overall.key_list.erase(key)
		Overall.clear_order(key)
		Overall.data.block.erase(key)
		Overall.left_node._update()
		Overall._hide()
func on_pressed8() -> void:
	Overall.left_node._update()
func _input(event) ->void:
	if event.is_action_pressed("mouse_left"):
		yield(get_tree(),"idle_frame")
		hide()

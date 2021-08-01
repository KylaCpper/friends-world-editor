extends Panel

func _ready() -> void:
	Overall.msg_node = self
	$button0.connect("pressed",self,"on_pressed0")
	$button1.connect("pressed",self,"on_pressed1")
	$button2.connect("pressed",self,"on_pressed2")
	$button3.connect("pressed",self,"on_pressed3")
	$button4.connect("pressed",self,"on_pressed4")
	$button5.connect("pressed",self,"on_pressed5")
	$button6.connect("pressed",self,"on_pressed6")
	
func _show() -> void:
	show()
func _check(index:int,type:String) -> String:
	if "new_"+type+str(index) in Overall.data[type]:
		return _check(index+1,type)
	return "new_"+type+str(index)
func new_data(type:String,node) -> void:
	var key = _check(0,type)
	Overall.data[type][key]={"key":key}
	node.set_data(Overall.data[type][key])
	Overall.left_node._update()
	Overall.select_item_node._update()
	hide()
func  on_pressed0() -> void:
	new_data("block",Overall.block_node)
	
func  on_pressed1() -> void:
	new_data("liquid_block",Overall.liquid_block_node)
func  on_pressed2() -> void:
	new_data("plant_block",Overall.plant_block_node)
func  on_pressed3() -> void:
	new_data("item",Overall.item_node)
func  on_pressed4() -> void:
	new_data("tool",Overall.tool_node)
func  on_pressed5() -> void:
	new_data("armor",Overall.armor_node)
func  on_pressed6() -> void:
	pass

func _input(event) ->void:
	if event.is_action_pressed("mouse_left"):
		yield(get_tree(),"idle_frame")
		hide()

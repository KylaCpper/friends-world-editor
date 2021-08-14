extends Panel
var age := ""
func _ready() -> void:
	Overall.msg_head_node = self
	$button0.connect("pressed",self,"on_pressed0")
	$button1.connect("pressed",self,"on_pressed1")
	$button2.connect("pressed",self,"on_pressed2")
func _show(age:String) -> void:
	self.age = age
	if !age:
		$button0.hide()
		$button1.hide()
		rect_size.y = 29
	else:
		$button0.show()
		$button1.show()
		rect_size.y = 70
	show()
func _check(index:int,type:String) -> String:
	for age in Overall.g_data:
		for type1 in Overall.g_data[age]:
			if type1 !="age":
				if "new_"+type+str(index) in Overall.data[type]:
					return _check(index+1,type)
				return "new_"+type+str(index)
	return "new_"+type+str(index)
func new_data(type:String,node) -> void:
	var key = _check(0,type)
	Overall.data[type][key]={"key":key}
	node.set_data(Overall.data[type][key])
	Overall.left_node._update()
	Overall.select_item_node._update()
	hide()
func on_pressed0() -> void:
	Overall.set_class_node._show(age)
	
func on_pressed1() -> void:
	Overall.sure_window_node._show(age,self)
func on_sure() -> void:
	Overall.head_node.delete_age(age)

func _input(event) ->void:
	if event.is_action_pressed("mouse_left"):
		yield(get_tree(),"idle_frame")
		hide()
func on_pressed2() -> void:
	if !Overall.head_node.open_project:
		Overall.msg_warn_node._show("错误","需要新建项目")
		return
	Overall.add_class_node._show()

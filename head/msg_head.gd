extends Panel
var age := ""
func _ready() -> void:
	Overall.msg_head_node = self
	$button0.connect("pressed",self,"on_pressed0")
	$button1.connect("pressed",self,"on_pressed1")
	
func _show(age:String) -> void:
	self.age = age
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

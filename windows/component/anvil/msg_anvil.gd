extends Panel
var key = null
var index = null
var copy
func _ready() -> void:
	$button0.connect("pressed",self,"_on_pressed0")
	$button1.connect("pressed",self,"_on_pressed1")
	$button2.connect("pressed",self,"_on_pressed2")
	$button3.connect("pressed",self,"_on_pressed3")
	$button4.connect("pressed",self,"_on_pressed4")
	$button5.connect("pressed",self,"_on_pressed5")
	$button6.connect("pressed",self,"_on_pressed6")
	$button7.connect("pressed",self,"_on_pressed7")
func _show(vec,key,index) -> void:
	rect_global_position = vec
#	rect_position = vec
	self.key = key
	self.index = index
	show()
func _on_pressed0() -> void:
	for i in range(99):
		if !i in Overall.anvil:
			Overall.anvil[i] = {"name":"新分类","data":[]}
			_update_tree()
			break
func _on_pressed1() -> void:
	if key != null:
		if key in Overall.anvil:
			$"../class"._show(key)
			
func _on_pressed2() -> void:
	if key != null:
		if key in Overall.anvil:
			Overall.anvil.erase(key)
			_update_tree()
func _on_pressed3() -> void:
	if key != null:
		if key in Overall.anvil:
			var d= {"export":[["",1,100,false]],"table":[["",1]],"note":"配方"+str(Overall.anvil[key].data.size()),"energy":1.0,"time":1.0}
			Overall.anvil[key].data.append(d)
			_update_tree()
func _on_pressed4() -> void:
	if key != null:
		if key in Overall.anvil:
			Overall.sure_window_node._show("",self)
func on_sure() -> void:
	Overall.anvil[key].data.remove(index)
	_update_tree()
func _on_pressed5() -> void:
	if key != null:
		if key in Overall.anvil:
			copy = Overall.anvil[key].data[index]
func _on_pressed6() -> void:
	if key != null:
		if key in Overall.anvil:
			if copy:
				copy = copy.duplicate(true)
				Overall.anvil[key].data.append(copy)
				_update_tree()
func _on_pressed7() -> void:
	_update_tree()
func _update_tree() -> void:
	$"../tree"._update()
func _update(data:Directory) -> void:
	pass
func _input(event):
	if event.is_action_pressed("mouse_left"):
		yield(get_tree(),"idle_frame")
		hide()
func gui_input(event) ->void:
	if $"../".visible == false:return
	if event.is_action_pressed("ctrl+c"):
		_on_pressed5()
	if event.is_action_pressed("ctrl+v"):
		_on_pressed6()
	if event.is_action_pressed("ctrl+d"):
		if key != null:
			if key in Overall.anvil:
				Overall.anvil[key].data.append(Overall.anvil[key].data[index].duplicate(true))
				_update_tree()

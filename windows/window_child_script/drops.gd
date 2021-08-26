extends VBoxContainer
var data := []
var drop_tscn := preload("res://windows/component/drop/drop.tscn")
func _ready() -> void:
	$add.connect("pressed",self,"on_pressed")
	
func on_pressed() -> void:
	var tscn = drop_tscn.instance()
	tscn.get_node("ui0").text = ""
	tscn.get_node("ui1").value = 1
	tscn.get_node("ui2").value = 100.0
	tscn.get_node("ui3").value = 0
	tscn.get_node("ui4").pressed = false
	if name in Overall.drop_node.data:
		data = Overall.drop_node.data[name]
	else:
		data = []
		Overall.drop_node.data[name] = data
		
		
	data.append({"name":"","num":1,"pro":100.0,"lv":0,"stop":false})
	tscn.data = data[data.size()-1]
	add_child(tscn)
func _free() -> void:
	for node in get_children():
		if node.name != "add":
			node.free()
func _add(data:Array) -> void:
	self.data = data
	for d in data:
		if !d.empty():
			var tscn = drop_tscn.instance()
			if !"name" in d:d.name = ""
			if !"num" in d:d.num = 1
			if !"pro" in d:d.pro = 100.0
			if !"lv" in d:d.lv = 0
			if !"stop" in d:d.stop = true
			tscn.get_node("ui0").text = d.name
			tscn.get_node("ui0").hint_tooltip = d.name
			tscn.get_node("ui1").value = d.num
			tscn.get_node("ui2").value = d.pro
			tscn.get_node("ui3").value = d.lv
			tscn.get_node("ui4").pressed = d.stop
			tscn.data = d
			add_child(tscn)
func _up(node) -> void:
	if node.get_parent() != self:return
	var i_max = get_child_count()-2
	var i = node.get_index()-1
	if i > 0:
		data[i] = data[i-1]
		data[i-1] = node.data 
		move_child(node,i)
func _down(node) -> void:
	if node.get_parent() != self:return
	var i_max = get_child_count()-2
	var i = node.get_index()-1
	if i < i_max:
		data[i] = data[i+1]
		data[i+1] = node.data
		move_child(node,i+2)

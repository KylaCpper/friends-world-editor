extends VBoxContainer
var data := []
var drop_tscn := preload("res://windows/component/drop/drop.tscn")
func _ready() -> void:
	$add.connect("pressed",self,"on_pressed")
	
func on_pressed() -> void:
	var tscn = drop_tscn.instance()
	tscn.get_node("ui0").text = "default"
	tscn.get_node("ui1").value = 1
	tscn.get_node("ui2").value = 100.0
	tscn.get_node("ui3").value = 0
	tscn.get_node("ui4").pressed = true
	if name in Overall.drop_node.data:
		data = Overall.drop_node.data[name]
	else:
		data = []
		Overall.drop_node.data[name] = data
		
		
	data.append({"name":"default","num":1,"pro":100.0,"lv":0,"stop":true})
	tscn.data = data[data.size()-1]
	add_child(tscn)

func _add(arr:Array) -> void:
	for node in get_children():
		if node.name != "add":
			node.free()
	self.data = data
	for data in arr:
		if !data.empty():
			var tscn = drop_tscn.instance()
			if !"name" in data:data.name = "default"
			if !"num" in data:data.num = 1
			if !"pro" in data:data.pro = 100.0
			if !"lv" in data:data.lv = 0
			if !"stop" in data:data.stop = true
			tscn.get_node("ui0").text = data.name
			tscn.get_node("ui1").value = data.num
			tscn.get_node("ui2").value = data.pro
			tscn.get_node("ui3").value = data.lv
			tscn.get_node("ui4").pressed = data.stop
			tscn.data = data
			add_child(tscn)

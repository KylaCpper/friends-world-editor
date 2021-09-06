extends VBoxContainer
var data := []
var ui_tscn := preload("res://info/ui/select_item_delete.tscn")
func _ready() -> void:
	$"../../../add".connect("pressed",self,"_on_pressed")
func _on_pressed() -> void:
	var tscn = ui_tscn.instance()
	tscn.text = ""
	data.append("")
	add_child(tscn)
func _update(data:Array) -> void:
	self.data = data
	for node in get_children():
		if node.name != "text":
			node.free()
	var i := 0
	for d in data:
		var tscn = ui_tscn.instance()
		tscn.text = d
		tscn.index = i
		add_child(tscn)
		i +=1
		
func _delete(index:int) -> void:
	data.remove(index)
	for node in get_children():
		if node.name != "text":
			if node.index > index:
				node.index -= 1
func set_data() -> Array:
	data = []
	for node in get_children():
		if node.name != "text":
			data.append(node.text)
	return data

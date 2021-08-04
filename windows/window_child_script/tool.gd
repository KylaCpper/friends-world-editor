extends Control
var data := []
var tool_tscn := preload("res://windows/component/tool/tool.tscn")
func _ready() -> void:
	pass
func _update(data:Array) -> void:
	self.data = data
	for node in get_children():
		node.free()
	var i := 0
	for d in data:
		var tscn = tool_tscn.instance()
		tscn.index = i
		tscn.data = d
		add_child(tscn)
		i = i+1



func _delete(i:int) -> void:
	data.remove(i)
	for node in get_children():
		if node.index>i:
			node.index = node.index -1 

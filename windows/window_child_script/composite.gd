extends VBoxContainer
var data := []
var composites_grid_tscn := preload("res://windows/component/composite/composites_grid.tscn")
func _ready() -> void:
	pass

func _update(data) -> void:
	self.data = data
	for node in get_children():
		if node.name != "add":
			node.free()
	for d in data:
		if !d.empty():
			var tscn = composites_grid_tscn.instance()
			tscn._update(d)
			add_child(tscn)

func _add(data) -> void:
	self.data = data
	var tscn = composites_grid_tscn.instance()
	data.append({"table":{},"name":Overall.data.key,"num":1,"time":1,"craft":"default"})
	tscn.data = data[data.size()-1]
	add_child(tscn)

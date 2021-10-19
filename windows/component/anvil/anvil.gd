extends GridContainer
var data := {}
var anvil_tscn := preload("res://windows/component/anvil/anvil_tscn.tscn")
var key := 0
var index := 0
func _ready() -> void:
	for node in get_children():
		node.free()
func _update(data:Dictionary,key:int,index:int) -> void:
	self.key = key
	self.data = data
	for node in get_children():
		node.queue_free()
	var tscn = anvil_tscn.instance()
	self.index = index
	tscn.index = index
	tscn.data = data
	add_child(tscn)
		
		
func _up(node) -> void:
	if node.get_parent() != self:return
	if index > 0:
		Overall.anvil[key].data[index] = Overall.anvil[key].data[index-1]
		Overall.anvil[key].data[index-1] = node.data
		_update(Overall.anvil[key].data[index-1],key,index-1)
		$"../../tree"._update(key,index)
		
func _down(node) -> void:
	if node.get_parent() != self:return
	if index < Overall.anvil[key].data.size()-1:
		Overall.anvil[key].data[index] = Overall.anvil[key].data[index+1]
		Overall.anvil[key].data[index+1] = node.data
		_update(Overall.anvil[key].data[index+1],key,index+1)
		$"../../tree"._update(key,index)

func _delete() -> void:
	Overall.anvil[key].data.remove(index)
	$"../../tree"._update()
#	$"../../"._delete(index)
#	data.remove(i)
#	for node in get_children():
#		node.index = node.index -1 

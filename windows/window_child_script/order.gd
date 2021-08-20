extends GridContainer


func _ready() -> void:
	pass
func _changed(key:String,num:int,obj) -> void:
	var i = Overall.order_key[key]
	var order = Overall.order
	
	order.erase(i)
	for ii in range(99):
		var num_be = num + ii
		if !num_be in order:
			order[num_be] = key
			num = num_be
			break
	Overall.order_key[key] = num
	obj.get_node("num").value = num
	Overall.order = str2var(var2str(Overall.order))
	
#	move_child(obj,num)
#	Overall.order_node._update()
#	for n in get_children():
#		order[n.index] = n.name





func _update(key:String) -> void:
	if key:
		for node in get_children():
			if key in node.name_:
				node.show()
			else:
				node.hide()
	else:
		for node in get_children():
			node.show()


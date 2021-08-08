extends GridContainer


func _ready() -> void:
	pass
func _changed(key:String,num:int,obj) -> void:
	move_child(obj,num)
	Overall.order_key[key] = num
	var order = Overall.order
	var i := 0
	for n in get_children():
		order[i] = n.name_
		i = i+1




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


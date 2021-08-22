extends Control

func _ready() -> void:
	pass
func _update(key:String,data:="") -> void:
	if key:
		for node in get_children():
			if key in node.name_:
				node.show()
				if data == node.name_:
					node.set_high_light(true)
				else:
					node.set_high_light(false)
			else:
				node.hide()
	else:
		for node in get_children():
			node.show()
			if data == node.name_:
				node.set_high_light(true)
			else:
				node.set_high_light(false)
func _pressed(key:String) -> void:
	$"../../".data = key
	$"../../".on_hide()

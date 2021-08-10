extends Control

func _ready() -> void:
	pass
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
func _pressed(key:String) -> void:
	$"../../".data = key
	$"../../".on_hide()
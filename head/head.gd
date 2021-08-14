extends ScrollContainer



func _ready() -> void:
	pass
	

func _gui_input(event) -> void:
	if event.is_action_pressed("mouse_right"):
		Overall.msg_head_node.rect_position = get_global_rect().position+event.position
		Overall.msg_head_node._show("")
		

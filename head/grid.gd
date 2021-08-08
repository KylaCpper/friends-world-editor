extends Button


func _ready() -> void:
	connect("pressed",$"../../../head_grid","on_grid_press",[$button.texture_normal,$text.text,$button.hint_tooltip])

func _gui_input(event) -> void:
	if event.is_action_pressed("mouse_right"):
		Overall.msg_head_node.rect_position = get_global_rect().position+event.position
		Overall.msg_head_node._show($button.hint_tooltip)

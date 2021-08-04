extends TextureRect
var side_size := 8
var size := 64
func _update(side_size) -> void:
	self.side_size = side_size
	size = 512/side_size
	$select.rect_size = Vector2(size,size)
func _gui_input(event) -> void:
	if event.is_action_pressed("mouse_left"):
		$select.rect_position = ((event.position)/size).floor() *size
		$"../../"._changed(((event.position)/size).floor())

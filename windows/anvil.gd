extends WindowDialog
var data :={}
func _ready() ->void:
	Overall.anvil_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$add.connect("pressed",self,"on_pressed")
func _update() -> void:
	$tree._update()
func _add(data:Dictionary) -> void:
	self.data = data
	on_pressed()
func on_pressed() -> void:
	$tree._update()
func _up(index:int) -> void:
	pass
func _down(index:int) -> void:
	pass
func _delete(index:int) -> void:
	pass

func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22-159,34)
	Overall.windows["anvil_node"]=[rect_size,rect_position]
func _show() -> void:
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	

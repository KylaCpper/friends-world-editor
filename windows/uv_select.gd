extends WindowDialog
var data :={}
#signal _changed(vec2)
var obj

func _ready() -> void:
	Overall.uv_select_node = self

func _show(data:Dictionary,obj) -> void:
	self.obj = obj
	self.data = data
#	$ScrollContainer/texture.texture = Overall.block_img
	$ScrollContainer/texture._update(Overall.side_size)
	popup()
func _show_model(data:Dictionary,obj) -> void:
	self.obj = obj
	self.data = data
#	$ScrollContainer/texture.texture = Overall.block_img_model
	$ScrollContainer/texture._update(32)
	popup()
func _changed(vec2:Vector2) -> void:
	data["x"] = vec2.x
	data["y"] = vec2.y
	if obj:
		obj.text = var2str(data)
		obj.hint_tooltip = var2str(data)
	

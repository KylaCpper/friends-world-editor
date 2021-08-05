extends Control

func _ready() -> void:
	pass 

func on_grid_press(tex:Texture,text:String,key:String) -> void:
	$button.texture_normal = tex
	$text.text = text
	Overall.age = key
	Overall.data = Overall.g_data[key]
	Overall.left_node._update()
	Overall._hide()

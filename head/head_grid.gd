extends Control

func _ready() -> void:
	pass 

func on_grid_press(tex:Texture,text:String) -> void:
	$button.texture_normal = tex
	$text.text = text

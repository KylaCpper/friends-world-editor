extends Button


func _ready() -> void:
	connect("pressed",$"../../../head_grid","on_grid_press",[$button.texture_normal,$text.text])

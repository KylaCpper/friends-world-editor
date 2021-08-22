extends Button
var name_ = ""

func _ready() -> void:
	connect("pressed",self,"on_pressed")
func set_high_light(be:bool) -> void:
	$ColorRect.visible = be
func on_pressed() -> void:
	$"../"._pressed(name_)

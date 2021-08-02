extends Button
var name_ = ""

func _ready() -> void:
	connect("pressed",self,"on_pressed")
func on_pressed() -> void:
	$"../"._pressed(name_)

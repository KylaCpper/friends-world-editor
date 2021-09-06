extends WindowDialog
var key
func _ready() -> void:
	$ScrollContainer/control/sure.connect("pressed",self,"on_hide")


func _show(key) -> void:
	self.key = key
	var data = Overall.furnace[key]
	$ScrollContainer/control/ui0.text = data.name
	popup()
	
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	hide()
	Overall.furnace[key].name = $ScrollContainer/control/ui0.text
	$"../tree"._update()

extends Control


func _ready() -> void:
	$import.connect("pressed",self,"on_import")
	$export.connect("pressed",self,"on_export")

func on_import() -> void:
	Overall.select_item_node._update()
func on_export() -> void:
	Overall.path_save_node.popup()

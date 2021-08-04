extends Control
var select := 0

func _ready() -> void:
	$import.connect("pressed",self,"on_import")
	$export.connect("pressed",self,"on_export")
	$import_img0.connect("pressed",self,"on_import_img0")
	$import_img1.connect("pressed",self,"on_import_img1")
func on_import() -> void:
	Overall.select_item_node._update()
func on_export() -> void:
	Overall.path_save_node.popup()

func on_import_img0() -> void:
	select = 0
	Overall.path_g_node._show("block_img",self)
func on_import_img1() -> void:
	select = 1
	Overall.path_g_node._show("block_img_model",self)

func _changed(path:String) -> void:
	if select == 0:
		Overall.block_img = load(path)
	else:
		Overall.block_img_model = load(path)

extends Control
var select := 0

func _ready() -> void:
	Overall.head_node = self
	$import.connect("pressed",self,"on_import")
	$export.connect("pressed",self,"on_export")
	$import_img0.connect("pressed",self,"on_import_img0")
	$import_img1.connect("pressed",self,"on_import_img1")

	
	$import_img0/num.connect("value_changed",self,"on_changed")
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
func on_changed(val) -> void:
	Overall.side_size = val
func _changed(path:String) -> void:
	var img = Image.new()
	img.load(path)
	var tex = ImageTexture.new()
	tex.create_from_image(img,0)
	if select == 0:
		Overall.block_img = tex
	else:
		Overall.block_img_model = tex

func add_age(tex:Texture,text:String,key:String) -> void:
	$head/hbox.add_grid(tex,text,key)



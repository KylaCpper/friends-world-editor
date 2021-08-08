extends Control
var select_png := 0
var open_dir := 0
var open_project := false
func _ready() -> void:
	Overall.head_node = self
	$new.connect("pressed",self,"on_new")
	$open.connect("pressed",self,"on_open")
	$save.connect("pressed",self,"on_save")
	$export.connect("pressed",self,"on_export")
	$export_order.connect("pressed",self,"on_export_order")
#	$import_img0.connect("pressed",self,"on_import_img0")
#	$import_img1.connect("pressed",self,"on_import_img1")
	var p = Function.get_save("set.cfg",null,true)
	if p:
		Overall.path = p

	$import_img0/num.connect("value_changed",self,"on_changed")
func on_new() -> void:
	open_dir = 1
	Overall.path_dir_node._show("选择目录",self)
	
func on_open() -> void:
	open_dir = 0
	Overall.path_dir_node._show("打开项目",self)
	
func on_save() -> void:
	open_dir = 1
	Overall.path_dir_node._show("保存项目",self)
func on_export() -> void:
#	Overall.path_save_node.type = 1
	Overall.path_save_node._show(1)
func on_export_order() -> void:
	Overall.order_node._show()
func on_import_img0() -> void:
	select_png = 0
	Overall.path_g_node._show("导入方块图",self)
func on_import_img1() -> void:
	select_png = 1
	Overall.path_g_node._show("导入自定义方块图",self)
func on_changed(val) -> void:
	Overall.side_size = val
func _changed(path:String) -> void:

	var img = Image.new()
	img.load(path)
	var tex = ImageTexture.new()
	tex.create_from_image(img,0)
	if select_png == 0:
		Overall.block_img = tex
	if select_png == 1:
		Overall.block_img_model = tex
func _changed_dir(path:String) -> void:
	Overall.path_node.current_dir = path
	Overall.path_save_node.current_dir = path
	Overall.path_g_node.current_dir = path
	Overall.path_dir_node.current_dir = path
	if open_dir == 0:
		Function.set_save("set.cfg",path,null,true)
		Overall.path = path
		var data = Function.read_file(path+"/config.cfg",null,true)
		if !data:
			open_project = false
			return
		open_project = true
		Overall.g_data = data.g_data
		Overall.block_img_path = data.block_img_path
		Overall.block_img_model_path = data.block_img_model_path
		Overall.side_size = data.side_size
		Overall.order = data.order
		Overall.order_key = data.order_key
		for age in data.g_data:
			var img1 = Image.new()
			img1.load(Overall.path+data.g_data[age].age.img)
			var tex1 = ImageTexture.new()
			tex1.create_from_image(img1,0)
			data.g_data[age].age.tex = tex1
			
			for type in data.g_data[age]:
				if type == "item" || type == "tool" || type == "armor" || type == "block":
					for key in data.g_data[age][type]:
						if !("img" in data.g_data[age][type][key]):data.g_data[age][type][key]["img"]=""
						data.g_data[age][type][key]["tex"]=null
						if data.g_data[age][type][key].img:
							var img = Image.new()
							img.load(Overall.path+data.g_data[age][type][key].img)
							var tex = ImageTexture.new()
							tex.create_from_image(img,0)
							data.g_data[age][type][key]["tex"] = tex
		Overall.order_node._update()
		Overall.select_item_node._update()
		_update()
		
#		if Overall.block_img_path:
#			var img = Image.new()
#			img.load(Overall.path+Overall.block_img_path)
#			var tex = ImageTexture.new()
#			tex.create_from_image(img,0)
#			Overall.block_img = tex
#		if Overall.block_img_model_path:
#			var img = Image.new()
#			img.load(Overall.path+Overall.block_img_model_path)
#			var tex = ImageTexture.new()
#			tex.create_from_image(img,0)
#			Overall.block_img_model = tex
		return
	if open_dir == 1:
		Overall.path = path
		Function.set_save("set.cfg",path,null,true)
		open_project = true
		var data = {
			"g_data":Overall.g_data,
			"block_img_path":Overall.block_img_path,
			"block_img_model_path":Overall.block_img_model_path,
			"side_size":Overall.side_size,
			"order":Overall.order,
			"order_key":Overall.order_key,
		}
		Overall.save_msg_node.popup()
		Function.write_file(path+"/config.cfg",data,null,true)
		for i in range(20):
			yield(get_tree(),"idle_frame")
		Overall.save_msg_node.hide()
func delete_age(age) -> void:
#	Overall.g_data[age] = Overall.g_data[age]
	Overall.g_data.erase(age)
	_update()
	$head_grid._clear()

func _update() -> void:
	for n in $head/hbox.get_children():
		n.free()
	for age in Overall.g_data:
		$head/hbox.add_grid(Overall.g_data[age].age.tex,Overall.g_data[age].age.name,Overall.g_data[age].age.key)

func add_age(tex:Texture,text:String,key:String) -> void:
	$head/hbox.add_grid(tex,text,key)
	
func on_grid_press(tex:Texture,text:String,key:String) -> void:
	$head_grid.on_grid_press(tex,text,key)
	
func _input(event) -> void:
	if event.is_action_pressed("ctrl+s"):
		if open_project:
			var data = {
				"g_data":Overall.g_data,
				"block_img_path":Overall.block_img_path,
				"block_img_model_path":Overall.block_img_model_path,
				"side_size":Overall.side_size,
				"order":Overall.order,
				"order_key":Overall.order_key,
			}
			
			Overall.save_msg_node.popup()
			Function.write_file(Overall.path+"/config.cfg",data,null,true)
			for i in range(20):
				yield(get_tree(),"idle_frame")
			Overall.save_msg_node.hide()

extends WindowDialog
func _ready() -> void:
	Overall.add_class_s_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	$ScrollContainer/add_class/add.connect("pressed",self,"on_hide")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,12)
	Overall.windows["add_class_node"]=[rect_size,rect_position]
func _show() -> void:
	popup()

func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	hide()
#	var key = get_next_group()
	var name_ = $ScrollContainer/add_class/ui0.text
	var type = $ScrollContainer/add_class/ui1.selected
	var img_path = $ScrollContainer/add_class/ui2/LineEdit.text
	if name_:
		var tex = null
		if img_path:
			var img = Image.new()
			img.load(img_path)
			img.resize(16,16)
			tex = ImageTexture.new()
			tex.create_from_image(img,0)
#						Overall.head_node.add_age(tex,name_,age)
		Overall.data.age["group"].append([name_,type,img_path,tex])
		$ScrollContainer/add_class/ui0.text = ""
		$ScrollContainer/add_class/ui1.selected = 0
		$ScrollContainer/add_class/ui2/LineEdit.text = ""
		Overall.left_node._update()
	


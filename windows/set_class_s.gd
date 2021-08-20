extends WindowDialog
var index :=-1
func _ready() -> void:
	Overall.set_class_s_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	$ScrollContainer/set_class/add.connect("pressed",self,"on_hide")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,12)
	Overall.windows["set_class_node"]=[rect_size,rect_position]
func _show(index:int) -> void:
	self.index = index
	if index > -1:
		var data = Overall.data.age.group[index]
		$ScrollContainer/set_class/ui0.text = data[0]
#		$ScrollContainer/set_class/ui1.selected= data[1]
		$ScrollContainer/set_class/ui2/LineEdit.text = data[2]
		popup()

func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	hide()
	var name_ = $ScrollContainer/set_class/ui0.text
#	var type = $ScrollContainer/set_class/ui1.selected
	var img_path = $ScrollContainer/set_class/ui2/LineEdit.text
	
	if index > -1:
				if name_:
					var data = Overall.data.age.group[index]
					if img_path:
						var img = Image.new()
						img.load(Overall.path+img_path)
						img.resize(16,16)
						var tex = ImageTexture.new()
						tex.create_from_image(img,0)
						data[3] = tex
					data[0] = name_
#					data[1] = type
					data[2] = img_path
					
					$ScrollContainer/set_class/ui0.text = ""
#					$ScrollContainer/set_class/ui1.selected= 0
					$ScrollContainer/set_class/ui2/LineEdit.text = ""
					Overall.left_node._update()

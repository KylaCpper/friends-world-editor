extends WindowDialog
var age := ""
func _ready() -> void:
	Overall.set_class_node = self
	connect("resized",self,"on_resized")
	$ScrollContainer/add_class/add.connect("pressed",self,"on_hide")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,12)
func _show(age:String) -> void:
	self.age = age
	var data = Overall.g_data[age].age
	if !"info" in data:data["info"] = ""
	$ScrollContainer/add_class/ui0.text = data.key
	$ScrollContainer/add_class/ui1.text= data.name
	$ScrollContainer/add_class/ui3/TextEdit.text = data.info
	$ScrollContainer/add_class/ui2.get_node("LineEdit").text = data.img
	$ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip = ""
	$ScrollContainer/add_class/ui4.text = data.name_en
	$ScrollContainer/add_class/ui5/TextEdit.text = data.info_en
	popup()

func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	hide()
	var key = $ScrollContainer/add_class/ui0.text
	var name_ = $ScrollContainer/add_class/ui1.text
	var info = $ScrollContainer/add_class/ui3/TextEdit.text
	var path = $ScrollContainer/add_class/ui2.get_node("LineEdit").text
	var g_path = $ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip
	var name_en = $ScrollContainer/add_class/ui4.text
	var info_en = $ScrollContainer/add_class/ui5/TextEdit.text
	if key:
			if path:
				if name_:
					var tex = Overall.g_data[age].age.tex
					if g_path:
						var img = Image.new()
						img.load(g_path)
						img.resize(16,16)
						tex = ImageTexture.new()
						tex.create_from_image(img,0)
					Overall.g_data[age].age.name = name_
					Overall.g_data[age].age.img = path
					Overall.g_data[age].age.key = key
					Overall.g_data[age].age.tex = tex
					if !(key in Overall.g_data):
						Overall.g_data[key] = Overall.g_data[age]
						Overall.g_data.erase(age)
					Overall.head_node._update()
					Overall.head_node.on_grid_press(tex,name_,key)
					
					$ScrollContainer/add_class/ui0.text = ""
					$ScrollContainer/add_class/ui1.text = ""
					$ScrollContainer/add_class/ui2.get_node("LineEdit").text = ""
					$ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip = ""
					$ScrollContainer/add_class/ui3/TextEdit.text = ""
					$ScrollContainer/add_class/ui4.text = ""
					$ScrollContainer/add_class/ui5/TextEdit.text = ""

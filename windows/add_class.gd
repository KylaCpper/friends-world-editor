extends WindowDialog
var list :={
	
}
func _ready() -> void:
	Overall.add_class_node = self
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
	var key = $ScrollContainer/add_class/ui0.text
	var name_ = $ScrollContainer/add_class/ui1.text
	var info = $ScrollContainer/add_class/ui3/TextEdit.text
	var path = $ScrollContainer/add_class/ui2.get_node("LineEdit").text
	var g_path = $ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip
	var name_en = $ScrollContainer/add_class/ui4.text
	var info_en = $ScrollContainer/add_class/ui5/TextEdit.text
	var index = $ScrollContainer/add_class/ui6.value
	if key:
		if !(key in Overall.g_data):
			if path:
				if name_:
					var img = Image.new()
					img.load(g_path)
					img.resize(16,16)
					var tex = ImageTexture.new()
					tex.create_from_image(img,0)
					Overall.head_node.add_age(tex,name_,key)
					Overall.g_data[key] = {"age":{"index":index,"name":name_,"info":info,"img":path,"key":key,"tex":tex,"name_en":name_en,"info_en":info_en},"block":{},"liquid_block":{},"item":{},"tool":{},"armor":{}}
					$ScrollContainer/add_class/ui0.text = ""
					$ScrollContainer/add_class/ui1.text = ""
					$ScrollContainer/add_class/ui2.get_node("LineEdit").text = ""
					$ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip = ""
					$ScrollContainer/add_class/ui3/TextEdit.text = ""
					$ScrollContainer/add_class/ui4.text = ""
					$ScrollContainer/add_class/ui5/TextEdit.text = ""


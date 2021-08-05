extends WindowDialog
var list :={
	
}
func _ready() -> void:
	Overall.add_class_node = self
	connect("resized",self,"on_resized")
	$ScrollContainer/add_class/add.connect("pressed",self,"on_hide")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(22,12)
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
	var path = $ScrollContainer/add_class/ui2.get_node("LineEdit").text
	var g_path = $ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip
	if key:
		if !(key in Overall.g_data):
			if path:
				if name_:
					Overall.g_data[key] = {"age":{"name":name_,"img":path,"key":key},"block":{},"liquid_block":{},"item":{},"tool":{},"armor":{}}
					var img = Image.new()
					img.load(g_path)
					var tex = ImageTexture.new()
					tex.create_from_image(img,0)
					Overall.head_node.add_age(tex,name_,key)
					$ScrollContainer/add_class/ui0.text = ""
					$ScrollContainer/add_class/ui1.text = ""
					$ScrollContainer/add_class/ui2.get_node("LineEdit").text = ""
					$ScrollContainer/add_class/ui2.get_node("LineEdit").hint_tooltip = ""


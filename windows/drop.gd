extends WindowDialog
var obj
var data :={}
func _ready() ->void:
	Overall.drop_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_hide")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(77,10)
func _show(title:String,data:Dictionary,obj) -> void:
	self.obj = obj
	self.window_title = title
	self.data = data
	
	for key in data:
		if key == "hand" || key == "pickaxe" || key == "shovel" || key == "axe" || key == "hammer" || key == "sword" || key == "fall":
			get_node("ScrollContainer/VBoxContainer/"+key)._add(data[key])
	popup()

func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
		obj.text = ""
		var i := 0
		var be := false
		var deletes := []
		clear()
		for key in data:
			i = 0
			be = false
			for data2 in data[key]:
				if data2.empty():
#						data.erase(i)
					deletes.append(i)
					be = true
				i = i+1
			if be:
				i = 0
				for d in deletes:
					data[key].remove(d-i)
					i = i+1
				deletes = []
		clear()

		
		obj.text=var2str(data)
		
		obj.emit_signal("text_changed")

func clear() -> void:
	for key in data:
		if data[key].empty():
			data.erase(key)
			clear()
			break
		else:
			if data[key][0].empty():
				data.erase(key)
				clear()
				break

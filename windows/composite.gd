extends WindowDialog
var obj
var data :=[]
func _ready() ->void:
	Overall.composite_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("popup_hide",self,"on_hide")
	$add.connect("pressed",self,"on_pressed")
func on_resized() -> void:
	$ScrollContainer.rect_size = rect_size - Vector2(34,38)
	Overall.windows["composite_node"]=[rect_size,rect_position]
func _show(title:String,data:Array,obj) -> void:
	self.obj = obj
#	self.window_title = title
	self.data = data
	$ScrollContainer/vbox._update(data)
	popup()
func on_hide() -> void:
	grab_focus()
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if obj:
		for node in $ScrollContainer/vbox.get_children():
			node.set_data()
		
		var deletes = []
		var i =0
		for d in data:
			if d.table.empty():
				deletes.append(i-deletes.size())
			i = i+1
		for ii in deletes:
			data.remove(ii)
		obj.text=var2str(data)
		obj.emit_signal("text_changed")

func on_pressed() -> void:
	$ScrollContainer/vbox._add(data)

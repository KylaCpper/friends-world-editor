extends Control
export (String ,"drop","food","composite","branch")var TYPE = "drop"
signal _changed(text_)
var data
func _ready() -> void:
	$button.connect("pressed",self,"on_pressed")
	$button2.connect("pressed",self,"on_pressed2")
	$text.connect("text_changed",self,"on_changed")
func on_pressed() -> void:
	Overall.textedit_node._show("edit",$text.text,$text)

func on_pressed2() -> void:
	if TYPE == "drop":
		Overall.drop_node._show("drop",data,$text)
	if TYPE == "food":
		Overall.food_node._show("food",data,$text)
	if TYPE == "composite":
		Overall.composite_node._show("composite",data,$text)
	if TYPE == "branch":
		Overall.branch_node._show("branch",data,$text)
func on_changed() -> void:
	var data = str2var($text.text)
	if TYPE == "drop":
		if typeof(data) != TYPE_DICTIONARY:return
		for key in data:
			self.data[key] = data[key]
	if TYPE == "food":
		if typeof(data) != TYPE_DICTIONARY:return
		for key in data:
			self.data[key] = data[key]
	if TYPE == "composite":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "branch":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	emit_signal("_changed",$text.text)

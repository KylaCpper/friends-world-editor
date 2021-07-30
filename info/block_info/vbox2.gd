extends VBoxContainer

var data := {}

var key_list := [
	"key","name","info","intensity","intensity_dig","mass",
	"max","smash","transparent","entity","model","material",
	"audio","dire","fuel","drop","food","tickable","script",
	"name_en","info_en"
]

func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
func _update(data) -> void:
	self.data = data
	$ui15.data = data.drop
	$ui16.data = data.food
	$ui17.data = data.composite
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
func on_text_changed(text:String,node,i:int) -> void:
	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

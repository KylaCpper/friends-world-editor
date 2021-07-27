extends VBoxContainer

var data := {}

var key_list := [
	"key","name","intensity","intensity_dig","mass",
	"max","smash","transparent","entity","model","material",
	"audio","dire","fuel","drop","food","tickable","script"
]

func _ready() -> void:
	var i := 0
	
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1

func on_focus_exited(node) -> void:
	node.deselect()
func on_text_changed(text:String,node,i:int) -> void:
	data[key_list[i]] = text

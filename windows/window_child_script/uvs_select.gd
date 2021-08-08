extends Control
var data := []

func _ready() -> void:
	$ui0.connect("_changed",self,"on_changed",[1])
	$ui1.connect("_changed",self,"on_changed",[2])
	$ui2.connect("_changed",self,"on_changed",[3])
	$ui3.connect("_changed",self,"on_changed",[4])
	$ui4.connect("_changed",self,"on_changed",[5])
	$ui5.connect("_changed",self,"on_changed",[6])
func _update(data:Array) -> void:
	self.data = data
	$ui0.get_node("LineEdit").text = data[1]
	
	$ui1.get_node("LineEdit").text = data[2]

	
	$ui2.get_node("LineEdit").text = data[3]

	
	$ui3.get_node("LineEdit").text = data[4]

	
	$ui4.get_node("LineEdit").text = data[5]

	
	$ui5.get_node("LineEdit").text = data[6]

	
func on_changed(path:String,i:int) -> void:
	data[i] = path

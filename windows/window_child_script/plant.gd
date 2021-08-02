extends Control
var data := []
func _ready() -> void:
	$ui0.connect("text_changed",self,"on_change0")
	$ui1.connect("text_changed",self,"on_change1")
func _update(data:Array) -> void:
	self.data = data
	if data.size() < 2:
		if data.size()==0:
			data.append("")
			data.append("")
		elif data.size()==1:
			data.append("")
	$ui0.text = data[0]
	$ui1.text = data[1]
func on_change0(text:String) -> void:
	data[0]=text
func on_change1(text:String) -> void:
	data[1]=text
func set_data() -> void:
	data[0]=$ui0.text
	data[1]=$ui1.text

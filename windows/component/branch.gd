extends Control
var data := []
func _ready() -> void:
	$ui0.connect("text_changed",self,"on_change0")
	$ui1.connect("text_changed",self,"on_change1")
	$ui2.connect("text_changed",self,"on_change2")
	$ui3.connect("text_changed",self,"on_change3")
func _update(data:Array) -> void:
	self.data = data
	if data.size() < 4:
		if data.size()==0:
			data.append("")
			data.append("")
			data.append("")
			data.append("")
		elif data.size()==1:
			data.append("")
			data.append("")
			data.append("")
		elif data.size()==2:
			data.append("")
			data.append("")
		elif data.size()== 3:
			data.append("")
	$ui0.text = data[0]
	$ui1.text = data[1]
	$ui2.text = data[2]
	$ui3.text = data[3]
func on_change0(text:String) -> void:
	data[0]=text
func on_change1(text:String) -> void:
	data[1]=text
func on_change2(text:String) -> void:
	data[2]=text
func on_change3(text:String) -> void:
	data[3]=text

func set_data() -> void:
	data[0]=$ui0.text
	data[1]=$ui1.text
	data[2]=$ui2.text
	data[3]=$ui3.text

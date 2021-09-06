extends Control
var data := []
func _ready() -> void:
	$"0/ui0".connect("text_changed",self,"on_change0")
func _update(data:Array) -> void:
	self.data = data
	if data.size() < 2:
		if data.size()==0:
			data.append("")
			data.append([])
		elif data.size()==1:
			data.append([])
	$"0/ui0".text = data[0]
#	$"1".data = data[1]
	if typeof(data[1]) != TYPE_ARRAY:
		data[1] = []
	$"1"._update(data[1])
func on_change0(text:String) -> void:
	data[0]=text

func set_data() -> void:
	data[0]=$"0/ui0".text
	data[1]=$"1".set_data()

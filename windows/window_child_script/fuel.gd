extends Control
var data := []
func _ready() -> void:
	$ui0.connect("_changed",self,"on_change0")
	$ui1.connect("_changed",self,"on_change1")
func _update(data:Array) -> void:
	self.data = data
	if data.size() < 2:
		if data.size()==0:
			data.append(0.0)
			data.append(0.0)
		elif data.size()==1:
			data.append(0.0)
	$ui0.value = data[0]
	$ui1.value = data[1]
func on_change0(num:float) -> void:
	data[0]=num
func on_change1(num:float) -> void:
	data[1]=num

func set_data() -> void:
	data[0]=$ui0.value
	data[1]=$ui1.value

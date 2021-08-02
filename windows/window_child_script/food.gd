extends Control
var data := []
func _ready() -> void:
	$ui0.connect("value_changed",self,"on_change",[0])
	$ui1.connect("value_changed",self,"on_change",[1])
	$ui2.connect("value_changed",self,"on_change",[2])
	$ui3.connect("value_changed",self,"on_change",[3])
	$ui4.connect("value_changed",self,"on_change",[4])
	$ui5.connect("value_changed",self,"on_change",[5])
	$ui6.connect("value_changed",self,"on_change",[6])
func _update(data:Array) -> void:
	self.data = data
	if data.size() < 7:
		for i in range(7-data.size()):
			data.append(0)
	$ui0.value = data[0]
	$ui1.value = data[1]
	$ui2.value = data[2]
	$ui3.value = data[3]
	$ui4.value = data[4]
	$ui5.value = data[5]
	$ui6.value = data[6]
func on_change(num:float,index:int) -> void:
	data[index] = num


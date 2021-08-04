extends Control
var data := []

func _ready() -> void:
	pass
func _update(data:Array) -> void:
	self.data = data
	$ui0.data = data[1]
	$ui0.text = var2str(data[1])
	$ui1.data = data[2]
	$ui1.text = var2str(data[2])
	$ui2.data = data[3]
	$ui2.text = var2str(data[3])
	$ui3.data = data[4]
	$ui3.text = var2str(data[4])
	$ui4.data = data[5]
	$ui4.text = var2str(data[5])
	$ui5.data = data[6]
	$ui5.text = var2str(data[6])
	



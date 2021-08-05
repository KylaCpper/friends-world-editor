extends Control
var data := []

func _ready() -> void:
	pass
func _update(data:Array,select:int) -> void:
	self.data = data
	$ui0.data = data[1]
	$ui0.select = select
	$ui0._update(data[1])
	
	$ui1.data = data[2]
	$ui1.select = select
	$ui1._update(data[2])
	
	$ui2.data = data[3]
	$ui2.select = select
	$ui2._update(data[3])
	
	$ui3.data = data[4]
	$ui3.select = select
	$ui3._update(data[4])
	
	$ui4.data = data[5]
	$ui4.select = select
	$ui4._update(data[5])
	
	$ui5.data = data[6]
	$ui5.select = select
	$ui5._update(data[6])
	



extends GridContainer
var data := []
func _ready() -> void:
	for i in range(6):
		get_node("ui"+str(i)).connect("_changed",self,"on_change",[i])
	
func _update(data:Array) -> void:
	self.data = data
	$ui0.value = data[0]
	$ui1.value = data[1]
	$ui2.value = data[2]
	$ui3.value = data[3]
	$ui4.value = data[4]
	$ui5.value = data[5]
func on_change(num:float,i:int) -> void:
	data[i]=num

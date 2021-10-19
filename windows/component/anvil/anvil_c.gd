extends Control

var data := []
var index := 0

func _ready():
	var key = data[0]
	var num = data[1]
	var pro = data[2]
	var stop = data[3]
	$ui0.text = key
	$ui1.value = num
	$ui2.value = pro
	$ui3.pressed = stop
	
	$ui0.connect("_changed",self,"_on_key")
	$ui1.connect("_changed",self,"_on_num")
	$ui2.connect("_changed",self,"_on_pro")
	$ui3.connect("_changed",self,"_on_stop")
	
	
	$delete.connect("pressed",self,"_on_delete")

func _on_key(text:String) -> void:
	data[0] = text
func _on_num(num) -> void:
	data[1] = num
func _on_pro(pro) -> void:
	data[2] = pro
func _on_stop(be:bool) -> void:
	data[3] = be

func _on_delete() -> void:
	queue_free()
	
	$"../../../"._delete_export(index)

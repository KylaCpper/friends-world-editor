extends Control

var data := []
var index := 0
func _ready():
	var key = data[0]
	var num = data[1]
	$ui0.text = key
	$ui1.value = num
	$ui0.connect("_changed",self,"_on_key")
	$ui1.connect("value_changed",self,"_on_num")
	
	
	
	$delete.connect("pressed",self,"_on_delete")

func _on_key(text:String) -> void:
	data[0] = text
func _on_num(num) -> void:
	data[1] = num

func _on_delete() -> void:
	queue_free()
	$"../../../"._delete_table(index)

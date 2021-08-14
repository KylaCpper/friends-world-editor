extends Control
var data :=[]
var index := 0

signal _changed(text_)
func _ready() -> void:
	$ui0.connect("_changed",self,"on_changed")
	$ui1.connect("_changed",self,"on_changed2")
	$delete.connect("pressed",self,"on_pressed")
	$ui0._show(data[0])
	$ui1.value = data[1]
func on_pressed() -> void:
	
	$"../"._delete(index)
	queue_free()
func on_changed(text_:String) -> void:
	data[0] = text_
	emit_signal("_changed",data)

func on_changed2(num:float) -> void:
	data[1] = num
	emit_signal("_changed",data)

extends HBoxContainer
var name_ = "default"
var num = 1

func _ready() -> void:
	$delete.connect("pressed",self,"on_pressed")
	$ui0.connect("text_changed",self,"on_changed0")
	$ui1.connect("value_changed",self,"on_changed1")
	$ui0.text = name_
	$ui1.value = num
func on_pressed() -> void:
	queue_free()
	
func on_changed0(text:String) -> void:
	name_ = text
	
func on_changed1(val:int) -> void:
	num = val
extends Control
var name_ = ""
var index :=0
func _ready() -> void:
	$num.value = index
	$num.connect("value_changed",self,"on_changed")
func on_changed(val:int) -> void:
	$"../"._changed(name_,val,self)

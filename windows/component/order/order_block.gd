extends Control
var name_ = ""
var index :=0
func _ready() -> void:
	$num.connect("value_changed",self,"on_changed")
	$num.value = index
func on_changed(val:int) -> void:
	$"../"._changed(name_,val,self)

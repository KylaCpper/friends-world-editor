extends Control
var data := {}
func _ready() -> void:
	$ui0.connect("text_changed",self,"on_change0")
	$ui1.connect("value_changed",self,"on_change1")
	$ui2.connect("value_changed",self,"on_change2")
	$ui3.connect("value_changed",self,"on_change3")
	$ui4.connect("toggled",self,"on_change4")
	$up.connect("pressed",self,"on_uped")
	$down.connect("pressed",self,"on_downed")
	$delete.connect("pressed",self,"on_pressed")
func on_change0(text:String) -> void:
	data.name = text
func on_change1(num:int) -> void:
	data.num = num
func on_change2(num:float) -> void:
	data.pro = num
func on_change3(num:int) -> void:
	data.lv = num
func on_change4(be:bool) -> void:
	data.stop = be

func on_pressed() -> void:
	data.clear()
	queue_free()
	
func on_uped() -> void:
	$"../"._up(self)
func on_downed() -> void:
	$"../"._down(self)

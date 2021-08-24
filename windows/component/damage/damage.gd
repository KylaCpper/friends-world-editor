extends Control
export var data :={}
var index := 0

signal _changed(text_)
func _ready() -> void:
	connect("modal_closed",self,"on_modal_closed")
	$ui0.connect("_changed",self,"on_changed")
	$ui1.connect("_changed",self,"on_changed2")
	$ui2.connect("_changed",self,"on_changed3")
	$ui3.connect("_changed",self,"on_changed4")
	$delete.connect("pressed",self,"on_pressed")
	$up.connect("pressed",self,"on_uped")
	$down.connect("pressed",self,"on_downed")
	$ui0.text = data.name
	$ui1.value = data.num
	$ui2.value = data.pro
	$ui3.pressed = data.stop
func on_pressed() -> void:
	$"../"._delete(index)
	queue_free()
func on_changed(text_:String) -> void:
	data["name"] = text_
	emit_signal("_changed",data)

func on_changed2(num:int) -> void:
	data["num"] = num
	emit_signal("_changed",data)


func on_changed3(num:float) -> void:
	data["pro"] = num
	emit_signal("_changed",data)
	

func on_changed4(pressed:bool) -> void:
	data["stop"] = pressed
	emit_signal("_changed",data)

func on_uped() -> void:
	$"../"._up(self)
func on_downed() -> void:
	$"../"._down(self)

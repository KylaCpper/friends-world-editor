extends ScrollContainer

var data := {
	"food":{}
}
var index := 0
var data_be := {
	"key":"",
	"name":"new_item",
	"info":"",
	"img":"",
	"img_material":"",
	"mass":1.0,
	"max":1,
	"fuel":false,
	"food":[],
	"armor":"",
	"hp":0,
	"damage":[],
	"composite":[],
	"tex":null,
	"script":"",
	"name_en":"","info_en":""
}
func _ready() -> void:
	Overall.armor_node = self
	$VBoxContainer/head/delete.connect("pressed",self,"on_delete")
	hide()
func on_delete() -> void:
	Overall.sure_window_node._show("",self)
func on_sure() -> void:
	Overall.data.armor.erase(data.key)
	Overall.left_node._update()
	Overall._hide()
func _update(data) -> void:
	self.data=data
	$VBoxContainer/HBoxContainer/vbox2._update(data)
	show()
func set_data(data:Dictionary) -> void:
	for key in data_be:
		if key != "key":
			if key == "composite":
				data[key] = []
			elif key =="food":
				data[key] = []
			elif key == "fuel":
				data[key] = []
			elif key == "damage":
				data[key] = []
			else:
				data[key] = data_be[key]

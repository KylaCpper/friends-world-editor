extends ScrollContainer
var key = "tool"
var data := {
	"drop":{},
	"food":{},
	"composite":[],
}
var index := 0
var data_be := {
	"class":"tool",
	"key":"",
	"name":"new_tool",
	"info":"",
	"img":"",
	"mass":1.0,
	"max":1,
	"tool":"",
	"lock_tool":true,
	"lv":0,
	"hp":10,
	"speed":1,
	"atk":1.0,
	"damage":[],
	"composite":[],
	"script":"",
	"tex":null,
	"fuel":[],
	"food":[],
	"other":"",
	"name_en":"","info_en":""
}
func _ready() -> void:
	Overall.tool_node = self
	$VBoxContainer/head/delete.connect("pressed",self,"on_delete")
	hide()
func on_delete() -> void:
	Overall.sure_window_node._show("",self)
func on_sure() -> void:
	Overall.key_list.erase(data.key)
	Overall.data["tool"].erase(data.key)
	Overall.clear_order(data.key)
	Overall.left_node._update()
	Overall._hide()
func _update(data) -> void:

	self.data=data
	if data.tex:
		$VBoxContainer/head/texture.texture = data.tex
	$VBoxContainer/HBoxContainer/vbox2._update(data)
	show()
func set_data(data:Dictionary) -> void:
	for key in data_be:
		if key != "key":
			if key == "composite":
				data[key] = []
			elif key == "damage":
				data[key] = []
			elif key == "food":
				data[key] = []
			elif key == "fuel":
				data[key] = [0,0]
			else:
				data[key] = data_be[key]

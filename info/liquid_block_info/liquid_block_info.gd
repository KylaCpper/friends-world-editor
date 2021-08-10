extends ScrollContainer

var data := {
	"drop":{},
	"food":{},
	"composite":[],
	"branch":[]
}
var index := 0
var data_be := {
	"key":"",
	"name":"new_liquid_block",
	"info":"",
	"intensity":0.0,
	"intensity_dig":0.0,
	"mass":1.0,
	"max":16,
	"smash":0,
	"transparent":true,
	"entity":false,
	"model":"",
	"material":6,
	"audio":"",
	"dire":0,
	"fuel":false,
	"drop":{},
	"food":false,
	"composite":[],
	"tick":false,
	"script":"base/block/liquid",
	"liquid":true,
	"branch":["","","",""],
	"plant":"",
	"uv":[],
	"name_en":"","info_en":""
}

func _ready() -> void:
	Overall.liquid_block_node = self
	$VBoxContainer/head/delete.connect("pressed",self,"on_delete")
	hide()
func on_delete() -> void:
	Overall.sure_window_node._show("",self)
func on_sure() -> void:
	Overall.key_list.erase(data.key)
	Overall.clear_order(data.key)
	Overall.data.liquid_block.erase(data.key)
	Overall.left_node._update()
	Overall._hide()
func _update(data) -> void:
	self.data=data

	$VBoxContainer/HBoxContainer/vbox2._update(data)
	show()
func set_data(data:Dictionary) -> void:
	for key in data_be:
		if key != "key":
			if key == "branch":
				data[key] = ["","","",""]
			elif key == "composite":
				data[key] = []
			elif key == "drop":
				data[key] = {}
			elif key == "uv":
				data[key] = []
			else:
				data[key] = data_be[key]

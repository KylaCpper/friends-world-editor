extends ScrollContainer
var key = "liquid_block"
var data := {
	"drop":{},
	"food":{},
	"composite":[],
	"branch":[]
}
var index := 0
var data_be := {
	"class":"liquid_block",
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
	"lock_material":true,
	"audio":"",
	"dire":0,
	"fuel":[],
	"drop":{},
	"food":false,
	"composite":[],
	"tick":false,
	"script":"/script/base/block/liquid",
	"liquid":true,
	"branch":["","","",""],
	"plant":"",
	"aabb":[],
	"uv":[],
	"other":"",
	"tex":Overall.model_img,
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
	Overall.data.liquid_block.erase(data.key)
	Overall.clear_order(data.key)
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
			elif key == "fuel":
				data[key] = [0,0]
			elif key == "uv":
				data[key] = []
			elif key == "aabb":
				data[key] = [0,0,0,0,0,0]
			else:
				data[key] = data_be[key]

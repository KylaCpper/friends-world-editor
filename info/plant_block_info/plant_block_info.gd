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
	"name":"new_plant_block",
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
	"fuel":[],
	"drop":{},
	"food":[],
	"composite":[],
	"tick":true,
	"script":"base/block/plant",
	"liquid":false,
	"branch":["","","",""],
	"plant":[],
	"name_en":"","info_en":""
}
func _ready() -> void:
	Overall.plant_block_node = self
	hide()
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
			elif key =="food":
				data[key] = []
			elif key == "fuel":
				data[key] = []
			elif key == "plant":
				data[key] = []
			else:
				data[key] = data_be[key]

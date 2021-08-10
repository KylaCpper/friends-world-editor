extends ScrollContainer

var data := {
	"drop":{},
	"food":{},
	"composite":[],
}
var index := 0
var data_be := {
	"key":"",
	"name":"new_block",
	"info":"",
	"intensity":1.0,
	"intensity_dig":1.0,
	"mass":1.0,
	"max":16,
	"smash":0,
	"transparent":false,
	"entity":true,
	"model":"",
	"material":0,
	"audio":"",
	"dire":0,
	"fuel":[],
	"drop":{},
	"food":[],
	"composite":[],
	"plant":[],
	"tick":false,
	"script":"",
	"liquid":false,
	"branch":false,
	"uv":[],
	"img":"",
	"tex":null,
	"name_en":"","info_en":""
}
func _ready() -> void:
	Overall.block_node = self
	$VBoxContainer/head/delete.connect("pressed",self,"on_delete")
	hide()
func on_delete() -> void:
	Overall.sure_window_node._show("",self)
func on_sure() -> void:
	Overall.key_list.erase(data.key)
	Overall.clear_order(data.key)

	Overall.data.block.erase(data.key)
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
			elif key == "drop":
				data[key] = {}
			elif key =="food":
				data[key] = []
			elif key == "fuel":
				data[key] = []
			elif key == "plant":
				data[key] = []
			elif key == "uv":
				data[key] = ["","","","","","",""]
			else:
				data[key] = data_be[key]
func update_block_tex() -> void:
	data.img = data.uv[0]
	var img = Image.new()
	img.load(Overall.path+data.img)
	var tex = ImageTexture.new()
	tex.create_from_image(img,0)
	data["tex"] = tex

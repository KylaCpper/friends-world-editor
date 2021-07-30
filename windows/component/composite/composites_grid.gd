extends HBoxContainer
var data := {
	"table":{},
	"name":"",
	"num":0,
	"time":0
}
var composite_grid_tscn := preload("res://windows/component/composite/composite_grid.tscn")
func _ready() -> void:
	$add.connect("pressed",self,"on_pressed")
func on_pressed() -> void:
	var tscn = composite_grid_tscn.instance()
	if !"table" in data:data["table"]={}
#	if !"name" in data:data["name"]=Overall.block_node.data.key
	if !"name" in data:data["name"]="default"
	if !"num" in data:data["num"]=1
	if !"time" in data:data["time"]=1
	tscn.name_ = ""
	tscn.num = 1
	$ui0.value = data.num
	$ui1.value = data.time
	add_child(tscn)
func _update(data) -> void:
	self.data = data
	$ui0.value = data.num
	$ui1.value = data.time
	if !"table" in data:
		return
	for node in get_children():
		if node.name != "add" && node.name != "ui0" && node.name != "time" && node.name != "ui1" && node.name != "label" && node.name != "num":
			node.free()
	for key in data.table:
		var tscn = composite_grid_tscn.instance()
		tscn.name_ = key
		tscn.num = data.table[key]
		add_child(tscn)

func set_data() -> void:
	data.table.clear()
	data.num = $ui0.value
	data.time = $ui1.value
	for node in get_children():
		if node.name != "add" && node.name != "ui0" && node.name != "time" && node.name != "ui1" && node.name != "label" && node.name != "num":
			if node.name_:
				data.table[node.name_]=node.num
		

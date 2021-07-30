extends ScrollContainer

var data := {
	"drop":{},
	"food":{},
	"composite":[],
}
var index := 0
var key_list := {
	
}
func _ready() -> void:
	_update()
func _update() -> void:
	Overall.block_node = self
	$VBoxContainer/HBoxContainer/vbox2._update(data)


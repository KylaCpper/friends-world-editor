extends OptionButton
signal _changed(num)
export (String ,"smash","dire") var TYPE = "smash"
var list := {
	"smash":["默认","硬型","脆型"],
	"dire":["无方向","4方向","6方向"],
	
}
var index := 0

func _ready() -> void:
	var i := 0
	for data in list[TYPE]:
		add_item(data,i)
		i = i +1
	selected = 0
	connect("item_selected",self,"on_selected")

func on_selected(index:int) -> void:
	if index == -1:index = 0
	self.index = index
	emit_signal("_changed",index)

extends OptionButton
signal _changed(num)
export (String ,"material") var TYPE = "material"
var list := {
	"material":["默认","透明","半透明","自定义","自定义透明","自定义半透明","液体","7"],
	
}

func _ready() -> void:
	var i := 0
	for data in list[TYPE]:
		add_item(data,i)
		i = i +1
	selected = 0
	$check.connect("pressed",self,"on_pressed")
	connect("item_selected",self,"on_selected")
	disabled = true

func on_pressed() -> void:
	if !$check.pressed:
		disabled = true
	else:
		disabled = false
	

func on_selected(index:int) -> void:
	if index == -1:index = 0
	emit_signal("_changed",index)

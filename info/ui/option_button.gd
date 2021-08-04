extends OptionButton
signal _changed(num)
export (String ,"smash","dire","tool","armor") var TYPE = "smash"
var list := {
	"smash":["默认","硬型","脆型"],
	"dire":["无方向","4方向","6方向"],
	"tool":["稿","斧","锄","锤","剑","铲"],
	"armor":["帽","衣","裤","鞋"]
	
}
var tool_ :=["pickaxe","axe","hoe","hammer","sword","shovel"]
var armor :=["hat","coat","pants","shoe"]
var index := 0

func _ready() -> void:
	var i := 0
	for data in list[TYPE]:
		add_item(data,i)
		i = i +1
	selected = 0
	connect("item_selected",self,"on_selected")
func _show(data:String) -> void:
	if TYPE == "tool":
		for i in range(list[TYPE].size()):
			if data == tool_[i]:selected = i
	if TYPE == "armor":
		for i in range(list[TYPE].size()):
			if data == armor[i]:selected = i
	
func on_selected(index:int) -> void:
	if index == -1:index = 0
	self.index = index
	if TYPE == "tool":
		emit_signal("_changed",tool_[index])
	elif TYPE == "armor":
		emit_signal("_changed",armor[index])
	else:
		emit_signal("_changed",index)

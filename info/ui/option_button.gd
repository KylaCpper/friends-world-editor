extends OptionButton
signal _changed(num)
export (String ,"smash","dire","tool","armor","craft","type_class") var TYPE = "smash"
var list := {
	"smash":["默认","硬型","脆型"],
	"dire":["无方向","4方向","6方向"],
	"tool":["稿","斧","锄","锤","剑","铲"],
	"armor":["帽","衣","袖","裤","鞋"],
	"craft":["默认","工作台"],
	"type_class":["block","liquid_block","item","tool","armor"],
	
}
var tool_ :=["pickaxe","axe","hoe","hammer","sword","shovel"]
var armor :=["hat","coat","sleeve","pants","shoe"]
var craft :=["default","craft_table"]
var index := 0
var ready := false
var select := 0
func _ready() -> void:
	var i := 0
	for data in list[TYPE]:
		add_item(data,i)
		i = i +1
	selected = select
	ready = true
	connect("item_selected",self,"on_selected")
func _show(data:String) -> void:
	if TYPE == "tool":
		for i in range(list[TYPE].size()):
			if data == tool_[i]:
				if !ready:
					select = i
				else:
					select(i)
				break
	if TYPE == "armor":
		for i in range(list[TYPE].size()):
			if data == armor[i]:
				if !ready:
					select = i
				else:
					select(i)
				break
	if TYPE == "craft":
		for i in range(list[TYPE].size()):
			if data == craft[i]:
				if !ready:
					select = i
				else:
					select(i)
#				selected = i
				break
func on_selected(index:int) -> void:
	if index == -1:index = 0
	self.index = index
	if TYPE == "tool":
		hint_tooltip = list[TYPE][index]
		emit_signal("_changed",tool_[index])
	elif TYPE == "armor":
		hint_tooltip = list[TYPE][index]
		emit_signal("_changed",armor[index])
	elif TYPE == "craft":
		hint_tooltip = list[TYPE][index]
		emit_signal("_changed",craft[index])
	else:
		emit_signal("_changed",index)

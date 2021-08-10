extends VBoxContainer

var data := {}
var key_list = [
	"key","name","info","mass","transparent",
	"model","material","tick",
	"script","branch","audio","name_en","info_en"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	for ii in range(13):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
func on_changed(d,i) -> void:
	if i == 0:
		if d in Overall.key_list:
			$ui0.text = data.key
			return
		else:
			Overall.data.liquid_block[d] = data
			Overall.data.liquid_block.erase(data.key)
			Overall.update_order(data.key,d)
			data.key = d
	if i==9:return
	data[key_list[i]] = d
	if !$ui6.get_node("check").pressed:
		data.material = 6
		$ui6.selected = data.material
	
func _update(data) -> void:
	self.data = data
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.value = data.mass
	$ui4.pressed = data.transparent
	$ui5.get_node("LineEdit").text = data.model
	$ui6.selected = data.material
	$ui7.pressed = data.tick
	$ui8.get_node("LineEdit").text = data.script
	$ui9.get_node("text").text = var2str(data.branch)
	$ui10.get_node("LineEdit").text = data.audio
	$ui11.text = data.name_en
	$ui12.get_node("TextEdit").text = data.info_en
	
	$ui9.data = data.branch
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

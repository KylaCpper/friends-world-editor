extends VBoxContainer

var data := {}
var key_list = [
	"key","name","info","mass","transparent",
	"model","material","tick",
	"script","branch","audio","name_en","info_en","other"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	for ii in range(14):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
	$ui6.connect("_switch",self,"on_switch",[6])
func on_changed(d,i) -> void:
	if i == 0:
		if d in Overall.key_list:
#			$ui0.text = data.key
			return
		else:
			Overall.data.liquid_block[d] = data
			Overall.data.liquid_block.erase(data.key)
			Overall.update_order(data.key,d,data.name)
			data.key = d
	if i==9:return
	data[key_list[i]] = d
	if !$ui6.get_node("check").pressed:
		data.material = 6
		$ui6.selected = data.material
func on_switch(be:bool,i:int) -> void:
	if i == 6:
		data.lock_material = !be
func _update(data) -> void:
	self.data = data
	$ui6.switch(true)
	$ui6.selected = data.material
	$ui6.switch(!data.lock_material)
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.value = data.mass
	$ui4.pressed = data.transparent
	$ui5.get_node("LineEdit").text = data.model
	$ui7.value = data.tick
	$ui8.get_node("LineEdit").text = data.script
	$ui9.get_node("text").text = var2str(data.branch)
	$ui10.get_node("LineEdit").text = data.audio
	$ui11.text = data.name_en
	$ui12.get_node("TextEdit").text = data.info_en
	$ui13.get_node("text").text = var2str(data.aabb)
	if "other" in data:
		$ui14.get_node("TextEdit").text = data.other
	else:
		$ui14.get_node("TextEdit").text = ""
	$ui9.data = data.branch
	$ui13.data = data.aabb
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

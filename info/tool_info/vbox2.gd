extends VBoxContainer

var data := {}

var key_list = [
	"key","name","info","img","mass","max","tool","lv","hp",
	"speed","atk","damage","script","fuel","food",
	"name_en","info_en"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	for ii in range(12):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
func on_changed(d,i) -> void:
	data[key_list[i]] = d
func _update(data) -> void:
	self.data = data
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.get_node("LineEdit").text = data.img
	$ui4.value = data.mass
	$ui5.value = data["max"]
	$ui6.get_node("text").text = var2str(data.fuel)
	$ui7.get_node("text").text = var2str(data.food)
	$ui8.get_node("text").text = var2str(data.plant)
	
	$ui9.get_node("LineEdit").text = data.script
	$ui10.text = data.name_en
	$ui11.text = data.info_en
	
	
	$ui6.data = data.fuel
	$ui7.data = data.food
	$ui8.data = data.plant
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

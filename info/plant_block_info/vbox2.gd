extends VBoxContainer

var data := {}

var key_list = [
	"key","name","info","intensity","intensity_dig","mass","smash","plant","transparent",
	"entity","model","material","audio","tick","fuel","drop",
	"script","name_en","info_en"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	for ii in range(17):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
func on_changed(d,i) -> void:
	data[key_list[i]] = d
func _update(data) -> void:
	self.data = data
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.value = data.intensity
	$ui4.value = data.intensity_dig
	$ui5.value = data.mass
	$ui6.selected = data.smash
	$ui7.get_node("text").text = var2str(data.plant)
	$ui8.pressed = data.transparent
	$ui9.pressed = data.entity
	$ui10.get_node("LineEdit").text = data.model
	$ui11.selected = data.material
	$ui12.get_node("LineEdit").text = data.audio
	$ui13.pressed = data.tick
	$ui14.get_node("text").text = var2str(data.fuel)
	$ui15.get_node("text").text = var2str(data.drop)
	$ui16.get_node("LineEdit").text = data.script
	$ui17.text = data.name_en
	$ui18.text = data.info_en
	
	$ui7.data = data.plant
	$ui14.data = data.fuel
	$ui15.data = data.drop

	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

extends VBoxContainer

var data := {}
var key_list = [
	"key","name","info","intensity","intensity_dig","mass","max","smash","transparent",
	"entity","model","material","audio","dire","drop","composite","fuel","food","plant","tick",
	"script","name_en","info_en"
]

func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
		i = i+1
	for ii in range(23):
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
	$ui6.value = data["max"]
	$ui7.selected = data.smash
	$ui8.pressed = data.transparent
	$ui9.pressed = data.entity
	$ui10.get_node("LineEdit").text = data.model
	$ui11.selected = data.material
	$ui12.get_node("LineEdit").text = data.audio
	$ui13.selected = data.dire
	$ui14.get_node("text").text = var2str(data.drop)
	$ui15.get_node("text").text = var2str(data.composite)
	$ui16.get_node("text").text = var2str(data.fuel)
	$ui17.get_node("text").text = var2str(data.food)
	$ui18.get_node("text").text = var2str(data.plant)
	$ui19.pressed = data.tick
	$ui20.get_node("LineEdit").text = data.script
	$ui21.text = data.name_en
	$ui22.text = data.info_en
	
	$ui14.data = data.drop
	$ui15.data = data.composite
	$ui16.data = data.fuel
	$ui17.data = data.food
	$ui18.data = data.plant
	
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

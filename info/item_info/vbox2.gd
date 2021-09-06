extends VBoxContainer

var data := {}

var key_list = [
	"key","name","info","img","mass","max",
	"fuel","food","plant","composite",
	"script","name_en","info_en"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	for ii in range(13):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
	$ui5.connect("_switch",self,"on_switch",[5])
func on_changed(d,i) -> void:
	if i==6 || i==7 || i==8 || i==9:return
	if i == 0:
		if d in Overall.key_list:
#			$ui0.text = data.key
			return
		else:
			Overall.data.item[d] = data
			Overall.data.item.erase(data.key)
			Overall.update_order(data.key,d,data.name)
			for dd in Overall.data.item[d].composite:
				dd.name = d
			data.key = d
	if i == 5 && !$ui5.get_node("check").pressed:
		return
	if i==3:
		if data[key_list[i]] != d:
			data[key_list[i]] = d
			var img = Image.new()
			img.load($ui3.get_node("LineEdit").hint_tooltip)
			img.resize(16,16)
			var tex = ImageTexture.new()
			tex.create_from_image(img,0)
			data["tex"] = tex
			Overall.left_node._update()
		
	data[key_list[i]] = d
	if i == 4:
		if !$ui5.get_node("check").pressed:
			data["max"] = Overall.get_max(d)
			$ui5.value = data["max"]
func on_switch(be:bool,i:int) -> void:
	if i == 5:
		data.lock_max = !be
func _update(data) -> void:
	self.data = data
	$ui5.switch(true)
	$ui5.value = data["max"]
	$ui5.switch(!data.lock_max)
	
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.get_node("LineEdit").text = data.img
	$ui4.value = data.mass
	$ui6.get_node("text").text = var2str(data.fuel)
	$ui7.get_node("text").text = var2str(data.food)
	$ui8.get_node("text").text = var2str(data.plant)
	$ui9.get_node("text").text = var2str(data.composite)
	$ui10.get_node("LineEdit").text = data.script
	$ui11.text = data.name_en
	$ui2.get_node("TextEdit").text = data.info_en
	
	
	$ui6.data = data.fuel
	$ui7.data = data.food
	$ui8.data = data.plant
	$ui9.data = data.composite
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

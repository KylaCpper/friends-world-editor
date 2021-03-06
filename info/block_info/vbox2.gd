extends VBoxContainer

var data := {}
var key_list = [
	"key","name","info","intensity","intensity_dig","mass","max","smash","transparent",
	"entity","model","material","audio","dire","drop","composite","fuel","food","plant","tick",
	"script","name_en","info_en","uv","img","other"
]

func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
		i = i+1
	for ii in range(26):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
	$ui4.connect("_switch",self,"on_switch",[4])
	$ui6.connect("_switch",self,"on_switch",[6])
	$ui11.connect("_switch",self,"on_switch",[11])
func on_changed(d,i) -> void:
	if i == 14 || i==15 || i==16 ||i ==17 || i==18 || i== 23 || i==24:return
	if i == 0:
		if d in Overall.key_list:
#			$ui0.text = data.key
			return
		else:
			Overall.data.block[d] = data
			Overall.data.block.erase(data.key)
			Overall.update_order(data.key,d,data.name)
			for dd in Overall.data.block[d].composite:
				dd.name = d
			data.key = d
	if i == 4 && !$ui4.get_node("check").pressed:
		return
	if i == 6 && !$ui6.get_node("check").pressed:
		return
	if i == 11 && !$ui11.get_node("check").pressed:
		return
	data[key_list[i]] = d
	if i == 5:
		if !$ui6.get_node("check").pressed:
			data["max"] = Overall.get_max(d)
			$ui6.value = data["max"]
	if i == 3:
		if !$ui4.get_node("check").pressed:
			data["intensity_dig"] = data["intensity"]
			$ui4.value = data["intensity_dig"]
	if i == 8 || i == 10:
		if !$ui11.get_node("check").pressed:
			if data.model:
				data.tex = Overall.model_img
				if data.transparent:
					data.material = 4
				else:
					data.material = 3
			else:
				if data.transparent:
					data.material = 1
				else:
					data.material = 0
			$ui11.selected = data.material

	
	if data.material<=2:
		$ui23.select = 0
	else:
		$ui23.select = 1
func on_switch(be:bool,i:int) -> void:
	if i == 4:
		data.lock_intensity_dig = !be
	if i == 6:
		data.lock_max = !be
	if i == 11:
		data.lock_material = !be
func _update(data) -> void:
	self.data = data
	$ui4.switch(true)
	$ui6.switch(true)
	$ui11.switch(true)
	
	$ui4.value = data.intensity_dig
	$ui6.value = data["max"]
	$ui11.selected = data.material
	
	$ui4.switch(!data.lock_intensity_dig)
	$ui6.switch(!data.lock_max)
	$ui11.switch(!data.lock_material)
	
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.value = data.intensity
	$ui5.value = data.mass
	$ui7.selected = data.smash
	$ui8.pressed = data.transparent
	$ui9.pressed = data.entity
	$ui10.get_node("LineEdit").text = data.model
	$ui12.get_node("LineEdit").text = data.audio
	$ui13.selected = data.dire
	$ui14.get_node("text").text = var2str(data.drop)
	$ui15.get_node("text").text = var2str(data.composite)
	$ui16.get_node("text").text = var2str(data.fuel)
	$ui17.get_node("text").text = var2str(data.food)
	$ui18.get_node("text").text = var2str(data.plant)
	$ui19.value = data.tick
	$ui20.get_node("LineEdit").text = data.script
	$ui21.text = data.name_en
	$ui22.get_node("TextEdit").text = data.info_en
	$ui23.get_node("text").text = var2str(data.uv)
	$ui24.get_node("text").text = var2str(data.aabb)
	if "other" in data:
		$ui25.get_node("TextEdit").text = data.other
	else:
		$ui25.get_node("TextEdit").text = ""
	$ui14.data = data.drop
	$ui15.data = data.composite
	$ui16.data = data.fuel
	$ui17.data = data.food
	$ui18.data = data.plant
	$ui23.data = data.uv
	$ui24.data = data.aabb
	

func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

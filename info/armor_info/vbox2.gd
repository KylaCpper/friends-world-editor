extends VBoxContainer

var data := {}

var key_list = [
	"key","name","info","img","armor","hp","mass","damage","fuel",
	"food","composite","script","name_en","info_en","img_material","other"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	for ii in range(15):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
	
func on_changed(d,i) -> void:
	if i == 0:
		if d in Overall.key_list:
#			$ui0.text = data.key
			return
		else:
			Overall.data.armor[d] = data
			Overall.data.armor.erase(data.key)
			Overall.update_order(data.key,d,data.name)
			for dd in Overall.data.armor[d].composite:
				dd.name = d
			data.key = d
	if i==7 || i==8 || i ==9 || i==10:
		pass
	else:
		if i == 3:
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
	data["max"] = 1
func _update(data) -> void:
	self.data = data
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.get_node("LineEdit").text = data.img
	$ui4._show(data.armor)
	$ui5.value = data.hp
	$ui6.value = data.mass
	$ui7.get_node("text").text = var2str(data.damage)
	$ui8.get_node("text").text = var2str(data.fuel)
	$ui9.get_node("text").text = var2str(data.food)
	$ui10.get_node("text").text = var2str(data.composite)

	$ui11.get_node("LineEdit").text = data.script
	$ui12.text = data.name_en
	$ui13.get_node("TextEdit").text = data.info_en
	
	$ui14.get_node("LineEdit").text = data.img_material
	if "other" in data:
		$ui15.get_node("TextEdit").text = data.other
	else:
		$ui15.get_node("TextEdit").text = ""
	$ui7.data = data.damage
	$ui8.data = data.fuel
	$ui9.data = data.food
	$ui10.data = data.composite
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()

	

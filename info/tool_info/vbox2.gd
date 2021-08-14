extends VBoxContainer

var data := {}

var key_list = [
	"key","name","info","img","mass","tool","speed","lv",
	"hp","atk","damage","script","fuel","food",
	"name_en","info_en"
]
func _ready() -> void:
	var i := 0
	for child in get_children():
		child.connect("focus_exited",self,"on_focus_exited",[child])
#		child.connect("text_changed",self,"on_text_changed",[child,i])
		i = i+1
	$ui17.connect("_pressed",self,"on_pressed")
	for ii in range(18):
		get_node("ui"+str(ii)).connect("_changed",self,"on_changed",[ii])
func on_pressed(press:bool) -> void:
	if press:
		$ui5.disabled = true
		$ui6.editable = false
#		if !$ui17.data:
#			$ui17.data = []
#		data["tool"] = $ui17.data
	else:
		$ui5.disabled = false
		$ui6.editable = true
	
func on_changed(d,i) -> void:
	if i == 0:
		if d in Overall.key_list:
			$ui0.text = data.key
			return
		else:
			Overall.data["tool"][d] = data
			Overall.data["tool"].erase(data.key)
			Overall.update_order(data.key,d)
			data.key = d
	if i==17:
		return
		var data_be = str2var(d)
		data["tool"] = data_be 
	else:
		if i==3:
			var img = Image.new()
			img.load($ui3.get_node("LineEdit").hint_tooltip)
			img.resize(16,16)
			var tex = ImageTexture.new()
			tex.create_from_image(img,0)
			data["tex"] = tex
		if i==10 || i==11 || i ==13 || i==14:
			pass
		else:
			data[key_list[i]] = d
	data["max"] = 1
func _update(data) -> void:
	self.data = data
	$ui0.text = data.key
	$ui1.text = data.name
	$ui2.get_node("TextEdit").text = data.info
	$ui3.get_node("LineEdit").text = data.img
	$ui4.value = data.mass
	if typeof(data["tool"]) == TYPE_STRING:
		$ui5._show(data["tool"])
		$ui6.value = data.speed
		$ui5.disabled = false
		$ui6.editable = true
		$ui17.on_checked(false)
		$ui17.get_node("text").text = ""
		$ui17.data = []
	else:
		$ui5.selected=-1
		$ui6.value = 0
		$ui5.disabled = true
		$ui6.editable = false
		$ui17.on_checked(true)
		$ui17.get_node("text").text = var2str(data["tool"])
		$ui17.data = data["tool"]
	
	$ui7.value = data.lv
	$ui8.value = data.hp
	$ui9.value = data.atk
	$ui10.get_node("text").text = var2str(data.damage)
	$ui11.get_node("text").text = var2str(data.composite)
	$ui12.get_node("LineEdit").text = data.script
	$ui13.get_node("text").text = var2str(data.fuel)
	$ui14.get_node("text").text = var2str(data.food)
	$ui15.text = data.name_en
	$ui16.get_node("TextEdit").text = data.info_en
	
	
	$ui10.data = data.damage
	$ui11.data = data.composite
	$ui13.data = data.fuel
	$ui14.data = data.food
#	$ui17.data = data.food
	
func on_focus_exited(node) -> void:
	if node.has_method("deselect"):
		node.deselect()
#func on_text_changed(text:String,node,i:int) -> void:
#	data[key_list[i]] = text

#func _input(event):
#	if event.is_action_pressed("esc"):
#		Overall.composite_node.grab_focus()

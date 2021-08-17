extends Control
export (String ,"drop","food","composite","branch","fuel","plant","tool","damage")var TYPE = "drop"
signal _changed(text_)
signal _pressed(be)
var data
func _ready() -> void:
	$button.connect("pressed",self,"on_pressed")
	$button2.connect("pressed",self,"on_pressed2")
	$text.connect("text_changed",self,"on_changed")
	$check.connect("toggled",self,"on_checked")
	on_checked(true,true)
func on_pressed() -> void:
	Overall.textedit_node._show("edit",$text.text,$text)
func switch(be:bool) -> void:
	be = !be
	$check.pressed = be
	if be:
		$text.readonly = false
		$button.disabled = false
		$button2.disabled = false
	else:
		$text.readonly = true
		$button.disabled = true
		$button2.disabled = true
func on_checked(pressed:bool,s:=false) -> void:
	$check.pressed = pressed
	if !s:
		emit_signal("_pressed",pressed)
	if pressed:
		$text.readonly = false
		$button.disabled = false
		$button2.disabled = false
	else:
		$text.readonly = true
		$button.disabled = true
		$button2.disabled = true
func on_pressed2() -> void:
	if TYPE == "drop":
		Overall.drop_node._show("drop",data,$text)
	if TYPE == "food":
		Overall.food_node._show("food",data,$text)
	if TYPE == "composite":
		Overall.composite_node._show("composite",data,$text)
	if TYPE == "branch":
		Overall.branch_node._show("branch",data,$text)
	if TYPE == "fuel":
		Overall.fuel_node._show("fuel",data,$text)
	if TYPE == "plant":
		Overall.plant_node._show("plant",data,$text)
	if TYPE == "tool":
		Overall.select_tool_node._show("tool",data,$text)
	if TYPE == "damage":
		Overall.damage_node._show("damage",data,$text)
func on_changed() -> void:
	var data = str2var($text.text)
	if TYPE == "drop":
		if typeof(data) != TYPE_DICTIONARY:return
		for key in data:
			self.data[key] = data[key]
	if TYPE == "food":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "composite":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "branch":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "fuel":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "plant":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "tool":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	if TYPE == "damage":
		if typeof(data) != TYPE_ARRAY:return
		var i := 0
		for d in data:
			self.data[i] = d
			i = i+1
	emit_signal("_changed",$text.text)

extends Tree
var key
var index
var root :TreeItem
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect("item_selected",self,"on_select")
	connect("item_rmb_selected",self,"on_select_rmb")
func _update(key1=null,index=null) -> void:
	if key1!=null:
		self.key = key1
	if index!=null:
		self.index = index
	clear()
	root = create_item(self)
	root.set_text(0,"root")
	root.set_tooltip(0, "root")
	var data = Overall.anvil
	for key in data:
		var g = create_item(root)
		g.set_text(0, data[key].name)
		g.set_tooltip(0, str(key))
		for i in range(data[key].data.size()):
			var be = create_item(g)
			be.set_text(0,data[key].data[i].note)
			be.set_tooltip(0, str(i))
			if self.key == key && self.index == i:
				be.select(0)

func on_select() -> void:
	var data = Overall.anvil
	var index = int(get_selected().get_tooltip(0))
	var parent_name = get_selected().get_parent().get_tooltip(0)
	
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if parent_name != "root":
		parent_name = int(parent_name)
		key = parent_name
		self.index = index
		$"../ScrollContainer/anvil"._update(data[parent_name].data[index],key,index)
		$"../msg_anvil".key = key
		$"../msg_anvil".index = index
	else:
		key = index
		$"../msg_anvil".key = key
func on_select_rmb(vec2:Vector2) -> void:
	vec2 = vec2 + Vector2(100,80)
	var data = Overall.anvil
	var index = int(get_selected().get_tooltip(0))
	var parent_name = get_selected().get_parent().get_tooltip(0)
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	yield(get_tree(),"idle_frame")
	if parent_name != "root":
		parent_name = int(parent_name)
		key = parent_name
		self.index = index
		$"../ScrollContainer/anvil"._update(data[parent_name].data[index],key,index)
		$"../msg_anvil"._show(vec2,key,index)
	else:
		key = index
		self.index = null
		$"../msg_anvil"._show(vec2,key,null)
func _gui_input(event) -> void:
	if event.is_action_pressed("mouse_right"):
		yield(get_tree(),"idle_frame")
#		if get_global_rect().has_point(event.position):
		$"../msg_anvil"._show(event.global_position,null,null)
#		else:
#			$"../msg_anvil".hide()
	$"../msg_anvil".gui_input(event)

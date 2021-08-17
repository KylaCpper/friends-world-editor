extends Node
var windows :={}
var path = ""
var block_img :Texture
var block_img_model :Texture
var block_img_path :=""
var block_img_model_path :=""
var side_size := 5
var order :={}
var order_key :={}
var key_list := {}
var buff := []
var order_c := false
var item_c := false
var age := ""
var g_data = {

}
var data = {
	"block":{
	},
	"liquid_block":{
		
	},
	"item":{
		
	},
	"tool":{
		
	},
	"armor":{
		
	}

}
const head_node_type := preload("res://head.gd")
var head_node :head_node_type
const add_class_node_type := preload("res://windows/add_class.gd")
var add_class_node:add_class_node_type
const set_class_node_type := preload("res://windows/set_class.gd")
var set_class_node:set_class_node_type
const sure_window_node_type := preload("res://windows/sure_window.gd")
var sure_window_node:sure_window_node_type
const msg_warn_node_type := preload("res://windows/msg_warn.gd")
var msg_warn_node:msg_warn_node_type
const block_node_type := preload("res://info/block_info/block_info.gd")
var block_node:block_node_type
const liquid_block_node_type := preload("res://info/liquid_block_info/liquid_block_info.gd")
var liquid_block_node:liquid_block_node_type
var plant_block_node
const item_node_type := preload("res://info/item_info/item_info.gd")
var item_node:item_node_type
const tool_node_type := preload("res://info/tool_info/tool_info.gd")
var tool_node:tool_node_type
const armor_node_type := preload("res://info/armor_info/armor_info.gd")
var armor_node:armor_node_type


#const tool_node_type := preload("res://info/tool_info/tool_info.gd")
#var tool_node:tool_node_type
#const armor_node_type := preload("res://info/armor_info/armor_info.gd")
#var armor_node:armor_node_type
const msg_node_type := preload("res://left/msg.gd")
var msg_node:msg_node_type
const msg_head_node_type := preload("res://head/msg_head.gd")
var msg_head_node:msg_head_node_type
const buff_node_type := preload("res://windows/buff.gd")
var buff_node:buff_node_type
const aabb_node_type := preload("res://windows/aabb.gd")
var aabb_node:aabb_node_type
const left_node_type := preload("res://left/left.gd")
var left_node:left_node_type
const save_msg_node_type := preload("res://windows/save_msg.gd")
var save_msg_node:save_msg_node_type
const uvs_select_node_type :=preload("res://windows/uvs_select.gd")
var uvs_select_node:uvs_select_node_type
const uv_select_node_type :=preload("res://windows/uv_select.gd")
var uv_select_node:uv_select_node_type
const textedit_node_type := preload("res://windows/textedit.gd")
var textedit_node :textedit_node_type
const path_g_node_type := preload("res://windows/path_g.gd")
var path_g_node 
const path_node_type := preload("res://windows/path.gd")
var path_node :path_node_type
const path_dir_node_type := preload("res://windows/path_dir.gd")
var path_dir_node :path_dir_node_type
const path_save_node_type := preload("res://windows/path_save.gd")
var path_save_node :path_save_node_type
const drop_node_type := preload("res://windows/drop.gd")
var drop_node :drop_node_type
const food_node_type := preload("res://windows/food.gd")
var food_node :food_node_type
const composite_node_type := preload("res://windows/composite.gd")
var composite_node:composite_node_type
const branch_node_type := preload("res://windows/branch.gd")
var branch_node:branch_node_type
const select_item_node_type := preload("res://windows/select_item.gd")
var select_item_node:select_item_node_type
const fuel_node_type := preload("res://windows/fuel.gd")
var fuel_node:fuel_node_type
const plant_node_type := preload("res://windows/plant.gd")
var plant_node:plant_node_type
const select_tool_node_type := preload("res://windows/tool.gd")
var select_tool_node:select_tool_node_type
const damage_node_type := preload("res://windows/damage.gd")
var damage_node:damage_node_type
const order_node_type := preload("res://windows/order.gd")
var order_node:order_node_type
func _ready() -> void:
	pass

func _hide() -> void:
	
	block_node.hide()
	liquid_block_node.hide()
	plant_block_node.hide()
	item_node.hide()
	tool_node.hide()
	armor_node.hide()

func get_max(mass:float) -> int:
	var max_ := 1
	if mass >= 0.0:
		max_ = 99
	if mass > 0.1:
		max_ = 64
	if mass >= 0.5:
		max_ = 32
	if mass >= 1.0:
		max_ = 16
	if mass >= 2.0:
		max_ = 8
	if mass >= 4.0:
		max_ = 4
	if mass >= 8.0:
		max_ = 2
	if mass >= 16.0:
		max_ = 1
	return max_

func update_order(okey,nkey,name_) -> void:
	key_list.erase(okey)
	key_list[nkey]=1
	if okey in order_key:
		var i = order_key[okey] 
		order[i] = nkey
		order_key.erase(okey)
		order_key[nkey] = i
		Overall.order_node._update()
#		order_c = true
	item_c = true
	Overall.left_node._change(nkey,name_)
#		update_list()
func next_key_list(name_:String,i:int) -> String:
	item_c = true
#	update_list()
	if !(name_+str(i) in key_list):
		return name_+str(i)
	else:
		return next_key_list(name_,i+1)

func clear_order(key:String) -> void:
	if key in Overall.order_key:
		var i = Overall.order_key[key]
		Overall.order_key.erase(key)
		Overall.order.erase(i)
		Overall.order_node._update()
#		order_c = true
	item_c = true
#		update_list()
func get_g_node(key:String):
	return self[key]

func update_list() -> void:
	select_item_node._update()
	
	

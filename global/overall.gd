extends Node
var path = "ase_work/friends_world/"
var age := ""
var data = {
	"block":{
	},
	"liquid_block":{
		
	},
	"plant_block":{
		
	},
	"item":{
		
	},
	"tool":{
		
	},
	"armor":{
		
	}
}
var block_node
var liquid_block_node
var plant_block_node
var msg_node

var left_node

var textedit_node :WindowDialog
var path_node :FileDialog
var path_dir_node :FileDialog
var path_save_node :FileDialog
var drop_node :WindowDialog
var food_node :WindowDialog
var composite_node:WindowDialog
var branch_node:WindowDialog
var select_item_node:WindowDialog

func _ready() -> void:
	pass

func _hide() -> void:
	block_node.hide()
	liquid_block_node.hide()
	plant_block_node.hide()

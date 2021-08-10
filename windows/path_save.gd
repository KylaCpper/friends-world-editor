extends FileDialog

var size := Vector2()
var obj
var type := 0
signal _changed(text)

func _ready() ->void:
	Overall.path_save_node = self
	connect("resized",self,"on_resized")
	connect("file_selected",self,"on_hide")
	if Overall.path:
		current_dir = Overall.path
func on_resized() -> void:
	size = rect_size
	
func _show(type:int) -> void:
	self.type = type
	if type == 0:
		window_title = "保存"
		filters = PoolStringArray([""])
	if type == 1:
		window_title = "导出"
		filters = PoolStringArray(["*.mod"])
	popup()
	
func on_hide(path:String) -> void:
	if type == 1:
		var data = {}
		var gdata = Overall.g_data.duplicate(true)
		var composite = {}
		var block = {}
		var liquid_block = {}
		var item = {}
		var tool_ = {}
		var armor = {}
		for age in gdata:
			composite[age] = {"default":{},"craft_table":{}}
			for type in gdata[age]:
				if type != "age":
					for key in gdata[age][type]:
						if type == "block":
							#uv
#							for d in gdata[age][type][key].uv:
#								uv[gdata[age][type][key].key] = d
							#合成表
							for d in gdata[age][type][key].composite:
								composite[age][d.craft][d.name]=d
							#物
#							for keyy in gdata[age][type][key]:
							gdata[age][type][key].erase("tex")
							gdata[age][type][key].erase("img")
							for i in range(7):
								if !gdata[age][type][key].uv[i]:
									gdata[age][type][key].uv[i] = gdata[age][type][key].uv[0]
							gdata[age][type][key].uv.pop_front()
							block[gdata[age][type][key].key] = gdata[age][type][key]
						if type == "liquid_block":
							#uv
#							for d in gdata[age][type][key].uv:
#								uv[gdata[age][type][key].key] = d
							#合成表
							for d in gdata[age][type][key].composite:
								composite[age][d.craft][d.name]=d
							#物
							gdata[age][type][key].erase("tex")
							gdata[age][type][key].erase("img")
#							for keyy in gdata[age][type][key]:
							liquid_block[gdata[age][type][key].key] = gdata[age][type][key]
								
						if type == "item":
							#合成表
							for d in gdata[age][type][key].composite:
								composite[age][d.craft][d.name]=d
							#物
							gdata[age][type][key].erase("tex")
#							for keyy in gdata[age][type][key]:
							item[gdata[age][type][key].key] = gdata[age][type][key]
						if type == "tool":
							#合成表
							for d in gdata[age][type][key].composite:
								composite[age][d.craft][d.name]=d
							#物
							gdata[age][type][key].erase("tex")
#							for keyy in gdata[age][type][key]:
							tool_[gdata[age][type][key].key] = gdata[age][type][key]
						if type == "armor":
							#合成表
							for d in gdata[age][type][key].composite:
								composite[age][d.craft][d.name]=d
							#物
							gdata[age][type][key].erase("tex")
#							for keyy in gdata[age][type][key]:
							tool_[gdata[age][type][key].key] = gdata[age][type][key]
						
		data["block"] = block
		data["liquid_block"] = liquid_block
		data["item"] = item
		data["tool"] = tool_
#		data["armor"] = armor
		data["composite"] = composite
		Function.write_file(path,var2str(data),null)





extends FileDialog

var size := Vector2()
var obj
var type := 0
signal _changed(text)

func _ready() ->void:
	Overall.path_save_node = self
	connect("resized",self,"on_resized")
	connect("popup_hide",self,"on_resized")
	connect("file_selected",self,"on_hide")
	if Overall.path:
		current_dir = Overall.path
func on_resized() -> void:
	size = rect_size
	Overall.windows["path_save_node"]=[rect_size,rect_position]
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
		var class_ = {}
		var order = []
		var buff = {
#			"key":deplete_time,move,absorb,atk,hand_speed,sub_hp,img,time,nutrition_absorb,nutrition_deplete_time
		}
		var g_buff = Overall.buff.duplicate(true)
		for d in g_buff:
			d.erase("tex")
			buff[d.key] = d
		for key in Overall.order:
			order.append(Overall.order[key])
		for age in gdata:
			composite[age] = {"default":{},"craft_table":{}}
			class_[age] = {}
			class_[age].key = age
			class_[age].name = gdata[age].age.name
			class_[age].info = gdata[age].age.info
			class_[age].name_en = gdata[age].age.name_en
			class_[age].info_en = gdata[age].age.info_en
			class_[age].img = gdata[age].age.img
			
			for type in gdata[age]:
				if type != "age":
					for key in gdata[age][type]:
						if type == "block":
							#uv
#							for d in gdata[age][type][key].uv:
#								uv[gdata[age][type][key].key] = d
							if !"aabb" in gdata[age][type][key]:
								gdata[age][type][key]["aabb"]=null
							else:
								var aabb = gdata[age][type][key].aabb
								if !aabb[0]&&!aabb[1]&&!aabb[2]&&!aabb[3]&&!aabb[4]&&!aabb[5]:
									gdata[age][type][key]["aabb"]=null
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
							if !"aabb" in gdata[age][type][key]:
								gdata[age][type][key]["aabb"]=null
							else:
								var aabb = gdata[age][type][key].aabb
								if !aabb[0]&&!aabb[1]&&!aabb[2]&&!aabb[3]&&!aabb[4]&&!aabb[5]:
									gdata[age][type][key]["aabb"]=null
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
							block[gdata[age][type][key].key] = gdata[age][type][key]
								
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
#		data["liquid_block"] = liquid_block
		data["item"] = item
		data["tool"] = tool_
#		data["armor"] = armor
		data["composite"] = composite
		data["age"] = class_
		data["order"] = order
		data["buff"] = buff
		Function.write_file(path,var2str(data),null)





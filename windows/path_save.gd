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
		var furnace = {}
		var anvil = []
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
		for key in Overall.furnace:
			var d = Overall.furnace[key].data
			for dd in d:
				var size = dd.table.size()
				if size > 0:
					if !size in furnace:furnace[size]=[]
					furnace[size].append({"export":dd["export"],"table":dd.table,"energy":dd.energy,"time":dd.time})
		for key in Overall.anvil:
			var d = Overall.anvil[key].data
			for dd in d:
				var size = dd.table.size()
				if size > 0:
					anvil.append([dd.export,dd.time,dd.table])
#					anvil.append({"export":dd["export"],"table":dd.table,"energy":dd.energy,"time":dd.time})
		for age in gdata:
			composite[age] = {"default":{},"craft_table":{}}
			class_[age] = {}
			class_[age].key = age
			class_[age].name = gdata[age].age.name
			class_[age].info = gdata[age].age.info
			class_[age].name_en = gdata[age].age.name_en
			class_[age].info_en = gdata[age].age.info_en
			class_[age].img = gdata[age].age.img
			class_[age].index = gdata[age].age.index
			
			for type in gdata[age]:
				if type=="block" ||type=="liquid_block" ||type=="item" ||type=="tool" ||type=="armor":
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
#									gdata[age][type][key].erase("aabb")
							#合成表
							_composite(gdata[age][type][key].composite,composite[age],furnace)
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
							if !gdata[age][type][key]["branch"][0]:
								gdata[age][type][key]["lv"]=0
								var next_branch = gdata[age][type][key]["branch"][1]
								var i := 1
								for ii in range(10):
									if next_branch:
										gdata[age][type][next_branch]["lv"]=i
										i = i +1
										next_branch = gdata[age][type][next_branch]["branch"][1]
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
							_composite(gdata[age][type][key].composite,composite[age],furnace)
							#物
							gdata[age][type][key].erase("tex")
							gdata[age][type][key].erase("img")
#							for keyy in gdata[age][type][key]:
							block[gdata[age][type][key].key] = gdata[age][type][key]
								
						if type == "item":
							#合成表
							_composite(gdata[age][type][key].composite,composite[age],furnace)
							#物
							gdata[age][type][key].erase("tex")
#							for keyy in gdata[age][type][key]:
							item[gdata[age][type][key].key] = gdata[age][type][key]
						if type == "tool":
							#合成表
							_composite(gdata[age][type][key].composite,composite[age],furnace)
							#物
							gdata[age][type][key].erase("tex")
#							for keyy in gdata[age][type][key]:
							tool_[gdata[age][type][key].key] = gdata[age][type][key]
						if type == "armor":
							#合成表
							_composite(gdata[age][type][key].composite,composite[age],furnace)
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
		data["furnace"] = furnace
		data["anvil"] = anvil
		data["age"] = class_
		data["order"] = order
		data["buff"] = buff
		for age in composite:
			if "craft_table" in composite[age]:
				if "default" in composite[age]:
					for key in composite[age]["default"]:
						composite[age]["craft_table"][key]=composite[age]["default"][key]
#					.append()
			
				
		var p = path.left(path.find_last("/"))
		Overall.head_node._save(p)
		Function.write_file(path,var2str(data),null)
	
func _composite(gcomposite,craft,furnace) -> void:
	for d in gcomposite:
		if d.craft == "furnace":
			var size = d.table.size()
			if !size in furnace:furnace[size] = {}
			if !d.name in furnace[size]:furnace[size][d.name] = []
			furnace[size][d.name].append(d)
		else:
			if !d.name in craft[d.craft]:craft[d.craft][d.name]=[]
			craft[d.craft][d.name].append(d)




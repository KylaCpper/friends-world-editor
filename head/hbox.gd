extends HBoxContainer


var grid_tscn = preload("res://head/grid.tscn")

	
func add_grid(tex:Texture,text:String,key:String) -> void:
	var tscn = grid_tscn.instance()
	tscn.get_node("button").texture_normal = tex
	tscn.get_node("button").hint_tooltip = key
	tscn.get_node("text").text = text
	add_child(tscn)

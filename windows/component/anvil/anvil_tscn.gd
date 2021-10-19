extends VBoxContainer

var data := {}
var index := 0

var table_tscn := preload("res://windows/component/anvil/anvil_t.tscn")
var export_tscn := preload("res://windows/component/anvil/anvil_c.tscn")
func _ready():
	$ui/ui0.value = data["energy"]
	$ui/ui1.text = data["note"]
	$ui/ui2.value = data["time"]
	var i := 0
	for d in data.table:
		var tscn = table_tscn.instance()
		tscn.data = d
		tscn.index = i
		$list/table.add_child(tscn)
		i = i+1
		
	i = 0
	for d in data["export"]:
		var tscn = export_tscn.instance()
		tscn.data = d
		tscn.index = i
		$list/export.add_child(tscn)
		i = i+1
	
	$ui/ui1.connect("_changed",self,"_on_note")
	$ui/ui0.connect("_changed",self,"_on_energy")
	$ui/ui2.connect("_changed",self,"_on_time")
	$ui/delete.connect("pressed",self,"_on_delete")
	$ui/up.connect("pressed",self,"_on_up")
	$ui/down.connect("pressed",self,"_on_down")
	
	$ui/add.connect("pressed",self,"_on_add")
	$ui/add2.connect("pressed",self,"_on_add2")
	

func _on_note(text:String) -> void:
	data["note"] = text
func _on_energy(num:float) -> void:
	data["energy"] = num
func _on_time(num:float) -> void:
	data["time"] = num
	
	
func _on_delete() -> void:
	Overall.sure_window_node._show("",self)
func on_sure() -> void:
	queue_free()
	$"../"._delete()
func _on_up() -> void:
	$"../"._up(self)
func _on_down() -> void:
	$"../"._down(self)

func _on_add() -> void:
	var d = ["",1]
	data["table"].append(d)
	var tscn = table_tscn.instance()
	tscn.data = d
	tscn.index = data["table"].size() - 1
	$list/table.add_child(tscn)
func _on_add2() -> void:
	var d = ["",1,100,false]
	data["export"].append(d)
	var tscn = export_tscn.instance()
	tscn.data = d
	tscn.index = data["export"].size() - 1
	$list/export.add_child(tscn)

func _delete_table(i:int) -> void:
	data.table.remove(i)
	for node in $list/table.get_children():
		if node.index > i:
			node.index = node.index - 1
func _delete_export(i:int) -> void:
	data["export"].remove(i)
	for node in $list/export.get_children():
		if node.index > i:
			node.index = node.index - 1

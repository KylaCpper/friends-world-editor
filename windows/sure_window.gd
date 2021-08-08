extends ConfirmationDialog
var age := ""
var obj
func _ready() -> void:
	Overall.sure_window_node = self
	connect("confirmed",self,"on_sure")

func _show(age:String,obj) -> void:
	self.age = age
	self.obj = obj
	popup()

func on_sure() -> void:
	if obj:
		obj.on_sure()

extends WindowDialog


func _ready() -> void:
	Overall.msg_warn_node = self

func _show(title:String,msg:String) -> void:
	self.window_title = title
	$Label.text = msg
	popup()

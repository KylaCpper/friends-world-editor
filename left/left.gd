extends Tree

onready var root :=  create_item(self)

func _ready():
	root.set_text(0, "root")
	
	var block = create_item(root)
	block.set_text(0, "block")
	var item = create_item(root)
	item.set_text(0, "item")
	var tool_ = create_item(root)
	tool_.set_text(0, "tool")
	var armor = create_item(root)
	armor.set_text(0, "armor")


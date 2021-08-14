extends Control
var data :={}
var index := 0
#deplete_time,move,absorb,atk,hand_speed,sub_hp,img,time,nutrition_absorb,nutrition_deplete_time
var key_list = [
	"time","move","hand_speed","atk","deplete_time","absorb","nutrition_absorb","nutrition_deplete_time",
	"sub_hp","img","name","info","name_en","info_en","key"
]
signal _changed(text_)
func _ready() -> void:
	for i in range(15):
		get_node("ui"+str(i)).connect("_changed",self,"on_changed",[i])
	
	$delete.connect("pressed",self,"on_pressed")
	$ui0.value = data.time
	$ui1.value = data.move
	$ui2.value = data.hand_speed
	$ui3.value = data.atk
	$ui4.value = data.deplete_time
	$ui5.value = data.absorb
	$ui6.value = data.nutrition_absorb
	$ui7.value = data.nutrition_deplete_time
	$ui8.value = data.sub_hp
	$ui9/LineEdit.text = data.img
	$ui9/LineEdit.hint_tooltip = Overall.path+data.img
	
	$ui10.text = data.name
	$ui10.hint_tooltip = data.name
	$ui11/TextEdit.text = data.info
	$ui11/TextEdit.hint_tooltip = data.info
	$ui12.text = data.name_en
	$ui12.hint_tooltip = data.name_en
	$ui13/TextEdit.text = data.info_en
	$ui13/TextEdit.hint_tooltip = data.info_en
	$ui14.text = data.key
	$ui14.hint_tooltip = data.key
	if data.tex:
		$texture.texture = data.tex
func on_pressed() -> void:
	$"../"._delete(index)
	queue_free()

func on_changed(d,i) -> void:
	if i == 14:
		for dd in Overall.buff:
			if dd.key == d:
				return
	if i ==9:
		var img = Image.new()
		img.load(Overall.path+d)
		img.resize(16,16)
		var tex = ImageTexture.new()
		tex.create_from_image(img,0)
		data.tex = tex
		$texture.texture = tex
	data[key_list[i]] = d


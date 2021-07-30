extends Control
var data := {}
func _ready() -> void:
	$ui0.connect("value_changed",self,"on_change0")
	$ui1.connect("value_changed",self,"on_change1")
	$ui2.connect("value_changed",self,"on_change2")
	$ui3.connect("value_changed",self,"on_change3")
	$ui4.connect("value_changed",self,"on_change4")
	$ui5.connect("value_changed",self,"on_change5")
func _update(data:Dictionary) -> void:
	self.data = data
	if !"satiety" in data:data["satiety"]=1.0
	if !"thirst" in data:data["thirst"]=0.0
	if !"phytonutrients" in data:data["phytonutrients"]=0.0
	if !"protein" in data:data["protein"]=0.0
	if !"ir" in data:data["ir"]=0.0
	if !"time" in data:data["time"]=1.0
	$ui0.value = data.satiety
	$ui1.value = data.thirst
	$ui2.value = data.phytonutrients
	$ui3.value = data.protein
	$ui4.value = data.ir
	$ui5.value = data.time
func on_change0(num:float) -> void:
	data.satiety = num
func on_change1(num:float) -> void:
	data.thirst = num
func on_change2(num:float) -> void:
	data.phytonutrients = num
func on_change3(num:float) -> void:
	data.protein = num
func on_change4(num:float) -> void:
	data.ir = num
func on_change5(num:float) -> void:
	data.time = num


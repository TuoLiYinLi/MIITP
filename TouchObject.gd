extends Sprite
class_name TouchObject

onready var scope:Node2D = get_node("/root/main/scene/scope")
onready var area2d:Area2D = $Area2D

var flag_focus:bool = false
var flag_pressed:bool = false
var flag_last_pressed:bool = false

func _ready():
	var r = area2d.connect("area_entered",self,"on_entered")
	if r!= OK:
		printerr("connect area failed")
	r = area2d.connect("area_exited",self,"on_exited")
	if r!= OK:
		printerr("connect area failed")

func _process(_delta):
	if flag_focus:
		flag_pressed = scope.flag_pressed
	else:
		flag_pressed = false
	
	if !flag_last_pressed and flag_pressed:
		on_pressed()
	elif flag_last_pressed and !flag_pressed:
		on_released()
	
	flag_last_pressed = flag_pressed

# 当进入时
func on_entered(_area2d):
	if _area2d.get_parent()!=scope or scope.flag_pressed:
		return
	print("on_entered")
	flag_focus = true

# 当离开时
func on_exited(_area2d):
	if _area2d.get_parent()!=scope:
		return
	print("on_exited")
	flag_focus = false

# 当被按下时
func on_pressed():
	print("on_pressed")

# 当被释放时
func on_released():
	print("on_released")


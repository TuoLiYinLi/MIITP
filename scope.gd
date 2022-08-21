extends Node2D
# scope.gd

var tar_scale:float = 1

func _process(delta):
#	sync_posi_remote()
	sync_posi_mouse()
	
	scale.x += (tar_scale-scale.x)*delta*10
	scale.y = scale.x

var flag_pressed:bool = false

func sync_posi_remote():
	var posi_msg = get_node("/root/main/TCP_server").posi_msg
	position.x = 720*(-0.5+posi_msg[0])
	position.y = 1440*(-0.5+posi_msg[1])
	get_node("/root/main/debug/Label3").text=str(posi_msg[0])
	get_node("/root/main/debug/Label4").text=str(posi_msg[1])
	
	if posi_msg.size()<3:
		return
		
	if posi_msg[2]<0.5:
		press()
	else:
		release()

func sync_posi_mouse():
	var posi = get_global_mouse_position()
	position = posi
	
	if Input.is_mouse_button_pressed(1):
		press()
	else:
		release()
	
func press():
	flag_pressed=true
	tar_scale = 0.6
	pass

func release():
	tar_scale = 1
	flag_pressed=false
	pass

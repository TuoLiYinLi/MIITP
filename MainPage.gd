extends TouchObject

var relative_position:float = 0

func on_pressed():
	.on_pressed()
	relative_position = position.y - get_global_mouse_position().y

func _process(delta):
	if flag_pressed:
		position.y = get_global_mouse_position().y+relative_position
	else:
		if position.y>738:
			position.y+=delta*2000
		else:
			position.y-=delta*2000
			
	if position.y<0:
		position.y=0
	if position.y>1476:
		position.y=1476

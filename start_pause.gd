extends TouchObject

export (Texture) var texture_start = null
export (Texture) var texture_pause = null

func on_released():
	.on_released()
	if texture == texture_start:
		texture = texture_pause
	else:
		texture = texture_start

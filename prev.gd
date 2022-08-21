extends TouchObject

signal play_prev_song

func on_released():
	.on_released()
	print("prev song")
	emit_signal("play_prev_song")

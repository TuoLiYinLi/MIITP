extends TouchObject

signal play_next_song

func on_released():
	.on_released()
	print("next song")
	emit_signal("play_next_song")
	

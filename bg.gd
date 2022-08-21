extends Node2D

onready var bglist:Array=[]
var bg_index:int = 0

func _ready():
	bglist.append($bg1)
	bglist.append($bg2)
	
	listen_next_song()
	listen_prev_song()

func listen_next_song():
	while true:
		yield(get_node("/root/main/scene/next"),"play_next_song")
		bg_index+=1
		sync_bg()


func listen_prev_song():
	while true:
		yield(get_node("/root/main/scene/prev"),"play_prev_song")
		bg_index-=1
		sync_bg()

func sync_bg():
	while bg_index >= bglist.size():
		bg_index-=bglist.size()
	while bg_index < 0:
		bg_index+=bglist.size()
	var count:int = 0
	for i in bglist:
		i.visible = bg_index==count
		count+=1

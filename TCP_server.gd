extends Node

var _server = TCP_Server.new()
var posi_msg:Array = [0,0]
func _process(_delta):
	if !_server.is_listening():
		var err = _server.listen(5050)
		if err == OK:
			get_node("/root/main/debug/Label2").text = "OK"
		else:
			get_node("/root/main/debug/Label2").text = "Failed"
			
	var socket = _server.take_connection()
	if socket:
		var res = socket.get_data(1024*16)
		assert(res[0]!=OK)
		var bpa:PoolByteArray = res[1]
		var msg = bpa.get_string_from_utf8()
		
		posi_msg=solve(msg)
		
#		print(bpa.get_string_from_utf8())
#		print(socket.get_utf8_string())

func solve(s:String):
	var some_array = s.split(" ",true,3)
	
	var f1 = (some_array[0] as String).to_float()
	var f2 = (some_array[1] as String).to_float()
	var f3 = (some_array[2] as String).to_float()
	
	print([f1,f2,f3])
	
	return [f1,f2,f3]

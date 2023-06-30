extends TextureRect

@onready var ffmpeg = $FFmpegNode

func _ready():
	var ret = ffmpeg.load_path("bigbuckbunny.webm")
	if ret == "":
		ffmpeg.play()
	else:
		print_debug("video load:%s" % ret)
	ffmpeg.set_loop(false)
	return

func _process(delta):
	if ffmpeg.is_playing():
		texture = ffmpeg.get_video_texture()
	else: 
		texture = null
	if Input.is_action_just_released("replay") && !ffmpeg.is_playing():
		#ffmpeg.stop()
		var ret = ffmpeg.load_path("bigbuckbunny.webm")
		if ret == "":
			ffmpeg.play()
		else:
			print_debug("video load:%s" % ret)
		
	return

extends TextureRect

@onready var ffmpeg = $FFmpegNode

func _ready():
	ffmpeg.load_path("bac01_Banker_Dragon_hd.mov")
	ffmpeg.play()
	ffmpeg.set_loop(false)
	return

func _process(delta):
	if ffmpeg.is_playing():
		texture = ffmpeg.get_video_texture()
	if Input.is_action_just_released("replay") && !ffmpeg.is_playing():
		var loaded = ffmpeg.load_path("bac01_Banker_Dragon_hd.mov")
		if !loaded:
			print_debug("load failed")
		ffmpeg.play()
	return

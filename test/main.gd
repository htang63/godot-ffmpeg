extends TextureRect

@onready var ffmpeg = $FFmpegNode

func _ready():
	ffmpeg.load_path("bigbuckbunny.webm")
	ffmpeg.play()
	ffmpeg.set_loop(false)
	return

func _process(delta):
	texture = ffmpeg.get_video_texture()
	return

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

func _input(event):
	if event.is_action_pressed("ui_left"):
		ffmpeg.seek(ffmpeg.get_playback_position() - TIME_SKIP)
	elif event.is_action_pressed("ui_right"):
		ffmpeg.seek(ffmpeg.get_playback_position() + TIME_SKIP)
	elif event.is_action_pressed("ui_accept"):
		ffmpeg.set_paused(not ffmpeg.is_paused())
	return
